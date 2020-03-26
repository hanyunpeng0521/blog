package com.hyp.learn.blog.business.srvice;


import com.hyp.learn.blog.business.entity.ArticleTags;

import java.util.List;

/**
 * 文章标签
 */
public interface PxArticleTagsService {

    int removeByArticleId(Long articleId);

    void insertList(Long[] tagIds, Long articleId);

    ArticleTags insert(ArticleTags entity);

    void insertList(List<ArticleTags> entities);
}
