package com.hyp.blog.service.impl;

import com.hyp.blog.commons.Page;
import com.hyp.blog.commons.service.BaseServiceImpl;
import com.hyp.blog.dao.ArticleDAO;
import com.hyp.blog.dao.impl.ArticleDAOImpl;
import com.hyp.blog.pojo.Article;
import com.hyp.blog.service.ArticleService;

import java.sql.SQLException;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.service.impl
 * hyp create at 19-12-12
 **/
public class ArticleServiceImpl extends BaseServiceImpl<Article, Long> implements ArticleService {
    private ArticleDAO articleDAO;

    public ArticleServiceImpl() {
        articleDAO = new ArticleDAOImpl();
        super.setBaseDAO(articleDAO);
    }

    @Override
    public Page findByUId(Long uid, int page, int size) throws SQLException {
        return articleDAO.findByUId(uid, page, size);
    }

    @Override
    public Page findByCId(Long cid, int page, int size) throws SQLException {
        return articleDAO.findByCId(cid, page, size);
    }
}

