package com.hyp.learn.blog.business.srvice.impl;


import cn.hutool.core.lang.Assert;
import com.hyp.learn.blog.business.entity.ArticleTags;
import com.hyp.learn.blog.business.srvice.PxArticleTagsService;
import com.hyp.learn.blog.persistence.beans.PxArticleTags;
import com.hyp.learn.blog.persistence.mapper.PxArticleTagsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 文章标签
 */
@Service
public class PxArticleTagsServiceImpl implements PxArticleTagsService {

    @Autowired
    private PxArticleTagsMapper pxArticleTagsMapper;

    /**
     * 通过文章id删除文章-标签关联数据
     *
     * @param articleId
     * @return
     */
    @Override
    public int removeByArticleId(Long articleId) {
        // 删除 文章-标签关联数据
        Example loveExample = new Example(PxArticleTags.class);
        Example.Criteria loveCriteria = loveExample.createCriteria();
        loveCriteria.andEqualTo("articleId", articleId);
        return pxArticleTagsMapper.deleteByExample(loveExample);
    }

    /**
     * 批量添加
     *
     * @param tagIds
     * @param articleId
     */
    @Override
    public void insertList(Long[] tagIds, Long articleId) {
        if (tagIds == null || tagIds.length == 0) {
            return;
        }
        List<ArticleTags> list = new ArrayList<>();
        ArticleTags articleTags = null;
        for (Long tagId : tagIds) {
            articleTags = new ArticleTags();
            articleTags.setTagId(tagId);
            articleTags.setArticleId(articleId);
            list.add(articleTags);
        }
        this.insertList(list);
    }

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ArticleTags insert(ArticleTags entity) {
        Assert.notNull(entity, "ArticleTags不可为空！");
        entity.setUpdateTime(new Date());
        entity.setCreateTime(new Date());
        pxArticleTagsMapper.insertSelective(entity.getPxArticleTags());
        return entity;
    }

    /**
     * 批量插入，支持批量插入的数据库可以使用，例如MySQL,H2等，另外该接口限制实体包含id属性并且必须为自增列
     *
     * @param entities
     */
    @Override
    public void insertList(List<ArticleTags> entities) {
        Assert.notNull(entities, "ArticleTagss不可为空！");
        List<PxArticleTags> list = new ArrayList<>();
        for (ArticleTags entity : entities) {
            entity.setUpdateTime(new Date());
            entity.setCreateTime(new Date());
            list.add(entity.getPxArticleTags());
        }
        pxArticleTagsMapper.insertList(list);
    }
}
