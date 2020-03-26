package com.hyp.learn.blog.framework.tag;

import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.entity.Article;
import com.hyp.learn.blog.business.enums.ArticleStatusEnum;
import com.hyp.learn.blog.business.srvice.PxArticleService;
import com.hyp.learn.blog.business.vo.ArticleConditionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.Map;

/**
 * 文章相关的自定义标签
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.tag
 * hyp create at 20-3-18
 **/
@Component
public class ArticleTags extends BaseTag {

    @Autowired
    private PxArticleService articleService;

    public ArticleTags() {
        super(ArticleTags.class.getName());
    }

    public Object recentArticles(Map params) {
        int pageSize = this.getPageSize(params);
        return articleService.listRecent(pageSize);
    }

    public Object recommendedList(Map params) {
        int pageSize = this.getPageSize(params);
        return articleService.listRecommended(pageSize);
    }

    public Object randomList(Map params) {
        int pageSize = this.getPageSize(params);
        return articleService.listRandom(pageSize);
    }

    public Object hotList(Map params) {
        int pageSize = this.getPageSize(params);
        return articleService.listHotArticle(pageSize);
    }

    public Object typeList(Map params) {
        int pageSize = this.getPageSize(params);
        long typeId = -1;
        String typeStr = getParam(params, "typeId");
        if (!StringUtils.isEmpty(typeStr)) {
            typeId = Long.parseLong(typeStr);
        }
        // 按文章分类查询
        ArticleConditionVO vo = new ArticleConditionVO();
        vo.setTypeId(typeId);
        // 已发布状态
        vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
        vo.setPageSize(pageSize);
        PageInfo<Article> pageInfo = articleService.findPageBreakByCondition(vo);
        return null == pageInfo ? null : pageInfo.getList();
    }
}

