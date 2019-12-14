package com.hyp.blog.service;

import com.hyp.blog.commons.Page;
import com.hyp.blog.commons.service.BaseService;
import com.hyp.blog.pojo.Article;

import java.sql.SQLException;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.service
 * hyp create at 19-12-12
 **/
public interface ArticleService extends BaseService<Article, Long> {

    Page findByUId(Long uid, int page, int size) throws SQLException;

    Page findByCId(Long cid, int page, int size) throws SQLException;

}
