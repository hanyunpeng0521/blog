package com.hyp.learn.blog.business.srvice.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.annotation.RedisCache;
import com.hyp.learn.blog.business.entity.Article;
import com.hyp.learn.blog.business.entity.User;
import com.hyp.learn.blog.business.enums.ArticleStatusEnum;
import com.hyp.learn.blog.business.enums.CommentStatusEnum;
import com.hyp.learn.blog.business.enums.FileUploadType;
import com.hyp.learn.blog.business.enums.ResponseStatus;
import com.hyp.learn.blog.business.srvice.PxArticleService;
import com.hyp.learn.blog.business.srvice.PxArticleTagsService;
import com.hyp.learn.blog.business.vo.ArticleConditionVO;
import com.hyp.learn.blog.file.FileUploader;
import com.hyp.learn.blog.file.entity.VFile;
import com.hyp.learn.blog.framework.exception.PxArticleException;
import com.hyp.learn.blog.framework.exception.PxException;
import com.hyp.learn.blog.framework.holder.RequestHolder;
import com.hyp.learn.blog.persistence.beans.*;
import com.hyp.learn.blog.persistence.mapper.*;
import com.hyp.learn.blog.plugin.file.GlobalFileUploader;
import com.hyp.learn.blog.utils.IpUtil;
import com.hyp.learn.blog.utils.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.entity.Example;

import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * 文章列表
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.business.srvice.impl
 * hyp create at 20-3-22
 **/
@Slf4j
@Service
public class PxArticleServiceImpl implements PxArticleService {

    @Autowired
    private PxArticleMapper pxArticleMapper;
    @Autowired
    private PxArticleLoveMapper pxArticleLoveMapper;
    @Autowired
    private PxArticleLookMapper pxArticleLookMapper;
    @Autowired
    private PxArticleTagsMapper pxArticleTagsMapper;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private PxArticleTagsService articleTagsService;
    @Autowired
    private PxCommentMapper commentMapper;

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    @Override
    public PageInfo<Article> findPageBreakByCondition(ArticleConditionVO vo) {
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<PxArticle> list = pxArticleMapper.findPageBreakByCondition(vo);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<Long> ids = list.stream().map(PxArticle::getId).collect(Collectors.toList());

        List<PxArticle> listTag = pxArticleMapper.listTagsByArticleId(ids);

        Map<Long, PxArticle> tagMap = listTag.stream().collect(Collectors.toMap(PxArticle::getId, a -> a, (k1, k2) -> k1));

        List<Article> boList = new LinkedList<>();
        for (PxArticle pxArticle : list) {
            PxArticle tagArticle = tagMap.get(pxArticle.getId());
            if (null == tagArticle) {
                log.warn("文章[{}] 未绑定标签信息，或者已绑定的标签不存在！", pxArticle.getTitle());
            } else {
                pxArticle.setTags(tagArticle.getTags());
            }
            this.subquery(pxArticle);
            boList.add(new Article(pxArticle));
        }
        PageInfo bean = new PageInfo<PxArticle>(list);
        bean.setList(boList);
        return bean;
    }

    /**
     * 站长推荐
     *
     * @param pageSize
     * @return
     */
    @Override
    public List<Article> listRecommended(int pageSize) {
        ArticleConditionVO vo = new ArticleConditionVO();
        vo.setRecommended(true);
        vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
        vo.setPageSize(pageSize);
        PageInfo pageInfo = this.findPageBreakByCondition(vo);
        return null == pageInfo ? null : pageInfo.getList();
    }

    /**
     * 近期文章
     *
     * @param pageSize
     * @return
     */
    @Override
    public List<Article> listRecent(int pageSize) {
        ArticleConditionVO vo = new ArticleConditionVO();
        vo.setPageSize(pageSize);
        vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
        PageInfo pageInfo = this.findPageBreakByCondition(vo);
        return null == pageInfo ? null : pageInfo.getList();
    }

    /**
     * 随机文章
     *
     * @param pageSize
     * @return
     */
    @Override
    public List<Article> listRandom(int pageSize) {
        ArticleConditionVO vo = new ArticleConditionVO();
        vo.setRandom(true);
        vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
        vo.setPageSize(pageSize);
        PageInfo pageInfo = this.findPageBreakByCondition(vo);
        return null == pageInfo ? null : pageInfo.getList();
    }

    /**
     * 根据某篇文章获取与该文章相关的文章<br>
     * 搜索同类型、同标签下的文章
     *
     * @param pageSize
     * @param article
     * @return
     */
    @Override
    public List<Article> listRelatedArticle(int pageSize, Article article) {
        if (null == article) {
            return listRandom(pageSize);
        }
        ArticleConditionVO vo = new ArticleConditionVO();
        vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
        List<PxTags> tags = article.getTags();
        if (!CollectionUtils.isEmpty(tags)) {
            List<Long> tagIds = new ArrayList<>();
            for (PxTags tag : tags) {
                tagIds.add(tag.getId());
            }
            vo.setTagIds(tagIds);
        }
        vo.setTypeId(article.getTypeId());
        vo.setPageSize(pageSize);
        PageInfo pageInfo = this.findPageBreakByCondition(vo);
        return null == pageInfo ? null : pageInfo.getList();
    }

    /**
     * 获取上一篇和下一篇
     *
     * @return
     */
    @Override
    public Map<String, Article> getPrevAndNextArticles(Date insertTime) {
        insertTime = null == insertTime ? new Date() : insertTime;
        List<PxArticle> entityList = pxArticleMapper.getPrevAndNextArticles(insertTime);
        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        Map<String, Article> resultMap = new HashMap<>();
        for (PxArticle entity : entityList) {
            if (entity.getCreateTime().getTime() < insertTime.getTime()) {
                resultMap.put("prev", new Article(entity));
            } else {
                resultMap.put("next", new Article(entity));
            }
        }
        return resultMap;
    }

    /**
     * 文章点赞
     *
     * @param id
     */
    @Override
    @RedisCache(flush = true)
    public void doPraise(Long id) {
        String ip = IpUtil.getRealIp(RequestHolder.getRequest());
        String key = ip + "_doPraise_" + id;
        ValueOperations<String, Object> operations = redisTemplate.opsForValue();
        if (redisTemplate.hasKey(key)) {
            throw new PxArticleException("一个小时只能点赞一次哈，感谢支持~~");
        }
        User user = SessionUtil.getUser();
        PxArticleLove love = new PxArticleLove();
        if (null != user) {
            love.setUserId(user.getId());
        }
        love.setArticleId(id);
        love.setUserIp(IpUtil.getRealIp(RequestHolder.getRequest()));
        love.setLoveTime(new Date());
        love.setCreateTime(new Date());
        love.setUpdateTime(new Date());
        pxArticleLoveMapper.insert(love);
        operations.set(key, id, 1, TimeUnit.HOURS);
    }

    /**
     * 是否存在文章
     *
     * @param id
     * @return
     */
    @Override
    public boolean isExist(Long id) {
        Integer count = pxArticleMapper.isExist(id);
        return count != null && count > 0;
    }

    /**
     * 发布文章
     *
     * @param article
     * @param tags
     * @param file
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean publish(Article article, Long[] tags, MultipartFile file) {
        if (null == tags || tags.length <= 0) {
            throw new PxArticleException("请至少选择一个标签");
        }
        if (null != file) {
            FileUploader uploader = new GlobalFileUploader();
            VFile virtualFile = uploader.upload(file, FileUploadType.COVER_IMAGE.getPath(), true);
            // 保存封面图片
            article.setCoverImage(virtualFile.getFilePath());
        }
        Long articleId = null;
        if ((articleId = article.getId()) != null) {
            this.updateSelective(article);
        } else {
            article.setUserId(SessionUtil.getUser().getId());
            articleId = this.insert(article).getId();
        }
        if (articleId != null) {
            articleTagsService.removeByArticleId(articleId);
            articleTagsService.insertList(tags, articleId);
        }
        return true;
    }

    /**
     * 修改置顶、推荐
     *
     * @param type
     * @param id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateTopOrRecommendedById(String type, Long id) {
        PxArticle article = pxArticleMapper.selectByPrimaryKey(id);
        article.setId(id);
        if ("top".equals(type)) {
            article.setTop(!article.getTop());
        } else if ("recommend".equals(type)) {
            article.setRecommended(!article.getRecommended());
        } else if ("comment".equals(type)) {
            article.setComment(!article.getComment());
        } else {
            throw new PxException(ResponseStatus.INVALID_PARAMS.getMessage());
        }
        article.setUpdateTime(new Date());
        return pxArticleMapper.updateByPrimaryKeySelective(article) > 0;
    }

    @Override
    public void batchUpdateStatus(Long[] ids, boolean status) {
        if (ids == null || ids.length <= 0) {
            return;
        }
        pxArticleMapper.batchUpdateStatus(Arrays.asList(ids), status);
    }

    /**
     * 获取热门文章
     *
     * @return
     */
    @Override
    public List<Article> listHotArticle(int pageSize) {
        PageHelper.startPage(1, pageSize);

        List<PxArticle> entityList = pxArticleMapper.listHotArticle();
        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<Article> list = new ArrayList<>();
        for (PxArticle entity : entityList) {
            list.add(new Article(entity));
        }
        return list;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Article insert(Article entity) {
        Assert.notNull(entity, "Article不可为空！");
        entity.setUpdateTime(new Date());
        entity.setCreateTime(new Date());
        entity.setOriginal(entity.isOriginal());
        entity.setComment(entity.isComment());
        pxArticleMapper.insertSelective(entity.getPxArticle());
        return entity;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean removeByPrimaryKey(Long primaryKey) {
        boolean result = pxArticleMapper.deleteByPrimaryKey(primaryKey) > 0;
        // 删除标签记录
        Example tagsExample = new Example(PxArticleTags.class);
        Example.Criteria tagsCriteria = tagsExample.createCriteria();
        tagsCriteria.andEqualTo("articleId", primaryKey);
        pxArticleTagsMapper.deleteByExample(tagsExample);
        // 删除查看记录
        Example lookExample = new Example(PxArticleLook.class);
        Example.Criteria lookCriteria = lookExample.createCriteria();
        lookCriteria.andEqualTo("articleId", primaryKey);
        pxArticleLookMapper.deleteByExample(lookExample);
        // 删除赞记录
        Example loveExample = new Example(PxArticleLove.class);
        Example.Criteria loveCriteria = loveExample.createCriteria();
        loveCriteria.andEqualTo("articleId", primaryKey);
        pxArticleLoveMapper.deleteByExample(loveExample);
        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateSelective(Article entity) {
        Assert.notNull(entity, "Article不可为空！");
        entity.setUpdateTime(new Date());
        entity.setOriginal(entity.isOriginal());
        entity.setComment(entity.isComment());
        return pxArticleMapper.updateByPrimaryKeySelective(entity.getPxArticle()) > 0;
    }

    @Override
    public Article getByPrimaryKey(Long primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        PxArticle entity = pxArticleMapper.get(primaryKey);
        if (null == entity) {
            return null;
        }
        this.subquery(entity);
        return new Article(entity);
    }

    private void subquery(PxArticle entity) {
        Long primaryKey = entity.getId();
        // 查看的次数
        PxArticleLook look = new PxArticleLook();
        look.setArticleId(primaryKey);
        entity.setLookCount(pxArticleLookMapper.selectCount(look));

        // 评论数
        Example example = new Example(PxComment.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("sid", primaryKey);
        criteria.andEqualTo("status", CommentStatusEnum.APPROVED.toString());
        entity.setCommentCount(commentMapper.selectCountByExample(example));

        // 喜欢的次数
        PxArticleLove love = new PxArticleLove();
        love.setArticleId(primaryKey);
        entity.setLoveCount(pxArticleLoveMapper.selectCount(love));
    }

    @Override
    public List<Article> listAll() {
        List<PxArticle> entityList = pxArticleMapper.selectAll();

        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<Article> list = new ArrayList<>();
        for (PxArticle entity : entityList) {
            list.add(new Article(entity));
        }
        return list;
    }
}

