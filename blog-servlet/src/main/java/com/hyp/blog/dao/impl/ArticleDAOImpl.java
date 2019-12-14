package com.hyp.blog.dao.impl;

import com.hyp.blog.commons.Page;
import com.hyp.blog.commons.Status;
import com.hyp.blog.commons.dao.BaseDAO;
import com.hyp.blog.dao.ArticleDAO;
import com.hyp.blog.pojo.Article;
import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.GenerousBeanProcessor;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.dao.impl
 * hyp create at 19-12-12
 **/
public class ArticleDAOImpl extends BaseDAO<Article> implements ArticleDAO {

    private String[] columns =
            new String[]{"title", "context", "user_id", "user_name", "clz_id", "clz_name"};
    private String[] allColumns =
            new String[]{"id", "title", "context", "user_id", "user_name", "clz_id", "clz_name", "is_deleted", "create_time", "modified_time"};


    @Override
    public Long insert(Article article) throws SQLException {
        if (Objects.isNull(article)
                || Objects.isNull(article.getTitle())
                || Objects.isNull(article.getContext())
                || Objects.isNull(article.getUserId())
                || Objects.isNull(article.getUserName())
                || Objects.isNull(article.getClzId())
                || Objects.isNull(article.getClzName())) {
            return -1L;
        }


        return super.insert(columns,
                article.getTitle(),
                article.getContext(),
                article.getUserId(),
                article.getUserName(),
                article.getClzId(),
                article.getClzName());
    }

    @Override
    public int update(Article article) throws SQLException {
        if (Objects.isNull(article)
                || Objects.isNull(article.getId())
                || Objects.isNull(article.getTitle())
                || Objects.isNull(article.getContext())
                || Objects.isNull(article.getUserId())
                || Objects.isNull(article.getUserName())
                || Objects.isNull(article.getClzId())
                || Objects.isNull(article.getClzName())) {
            return -1;
        }


        return super.update(columns, "id=?",
                article.getTitle(),
                article.getContext(),
                article.getUserId(),
                article.getUserName(),
                article.getClzId(),
                article.getClzName(),
                article.getId());
    }

    @Override
    public int delete(Long id) throws SQLException {
        if (Objects.isNull(id)) {
            return -1;
        }
        return super.delete("id=?", id);
    }

    @Override
    public Article findById(Long id) throws SQLException {
        if (Objects.isNull(id)) {
            return null;
        }
        return super.query(allColumns, "id=? and is_deleted != ?",
                new BeanHandler<Article>(Article.class,
                        new BasicRowProcessor(new GenerousBeanProcessor()))
                , id, Status.DELETED.getCode());
    }

    @Override
    public List<Article> findAll() throws SQLException {
        return super.queryAll(allColumns, "is_deleted != ?",
                new BeanListHandler<Article>(Article.class,
                        new BasicRowProcessor(new GenerousBeanProcessor())),
                "id asc", Status.DELETED.getCode());
    }

    @Override
    public Page findAll(Integer page, Integer size) throws SQLException {
        return super.queryAll(allColumns, "is_deleted != ?",
                new BeanListHandler<Article>(Article.class,
                        new BasicRowProcessor(new GenerousBeanProcessor()))
                , page, size
                , "id asc", Status.DELETED.getCode());
    }

    @Override
    public String getTableName() {
        return "article";
    }

    @Override
    public Page findByUId(Long uid, int page, int size) throws SQLException {
        return super.queryAll(allColumns, "is_deleted != ? and user_id = ? ",
                new BeanListHandler<Article>(Article.class,
                        new BasicRowProcessor(new GenerousBeanProcessor()))
                , page, size
                , "modified_time desc", Status.DELETED.getCode(), uid);
    }

    @Override
    public Page findByCId(Long cid, int page, int size) throws SQLException {
        return super.queryAll(allColumns, "is_deleted != ? and clz_id = ? ",
                new BeanListHandler<Article>(Article.class,
                        new BasicRowProcessor(new GenerousBeanProcessor()))
                , page, size
                , "modified_time desc", Status.DELETED.getCode(), cid);
    }
}
