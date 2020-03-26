package com.hyp.learn.blog.business.srvice;


import com.hyp.learn.blog.business.entity.Article;
import com.hyp.learn.blog.business.entity.Statistics;

import java.util.List;

/**
 * 统计
 */
public interface PxStatisticsService {
    /**
     * 获取热门文章
     *
     * @return
     */
    List<Article> listHotArticle(int pageSize);

    /**
     * 获取爬虫统计
     *
     * @return
     */
    List<Statistics> listSpider(int pageSize);

    /**
     * 获取文章分类统计
     *
     * @return
     */
    List<Statistics> listType(int pageSize);

}
