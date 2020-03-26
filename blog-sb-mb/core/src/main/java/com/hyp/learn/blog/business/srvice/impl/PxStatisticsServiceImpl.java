package com.hyp.learn.blog.business.srvice.impl;


import com.github.pagehelper.PageHelper;
import com.hyp.learn.blog.business.entity.Article;
import com.hyp.learn.blog.business.entity.Statistics;
import com.hyp.learn.blog.business.srvice.PxArticleService;
import com.hyp.learn.blog.business.srvice.PxStatisticsService;
import com.hyp.learn.blog.persistence.beans.PxStatistics;
import com.hyp.learn.blog.persistence.mapper.PxStatisticsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 统计
 */
@Service
public class PxStatisticsServiceImpl implements PxStatisticsService {

    @Autowired
    private PxStatisticsMapper statisticsMapper;
    @Autowired
    private PxArticleService articleService;

    /**
     * 获取热门文章
     *
     * @return
     */
    @Override
    public List<Article> listHotArticle(int pageSize) {
        return articleService.listHotArticle(pageSize);
    }

    /**
     * 获取爬虫统计
     *
     * @return
     */
    @Override
    public List<Statistics> listSpider(int pageSize) {
        PageHelper.startPage(1, pageSize);
        List<PxStatistics> entityList = statisticsMapper.listSpider();
        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<Statistics> list = new ArrayList<>();
        for (PxStatistics entity : entityList) {
            list.add(new Statistics(entity));
        }
        return list;
    }

    /**
     * 获取文章分类统计
     *
     * @return
     */
    @Override
    public List<Statistics> listType(int pageSize) {
        PageHelper.startPage(1, pageSize);
        List<PxStatistics> entityList = statisticsMapper.listType();
        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<Statistics> list = new ArrayList<>();
        for (PxStatistics entity : entityList) {
            list.add(new Statistics(entity));
        }
        return list;
    }

}
