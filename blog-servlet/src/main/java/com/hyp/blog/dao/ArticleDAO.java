package com.hyp.blog.dao;

import com.hyp.blog.commons.Page;
import com.hyp.blog.commons.dao.CommonBaseDAO;
import com.hyp.blog.pojo.Article;

import java.sql.SQLException;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.dao
 * hyp create at 19-12-12
 **/
public interface ArticleDAO extends CommonBaseDAO<Article, Long> {
    Page findByUId(Long uid, int page, int size) throws SQLException;

    Page findByCId(Long uid, int page, int size) throws SQLException;

}
