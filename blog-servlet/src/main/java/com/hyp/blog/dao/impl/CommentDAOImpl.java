package com.hyp.blog.dao.impl;

import com.hyp.blog.commons.Page;
import com.hyp.blog.commons.Status;
import com.hyp.blog.commons.dao.BaseDAO;
import com.hyp.blog.dao.CommentDAO;
import com.hyp.blog.pojo.Comment;
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
public class CommentDAOImpl extends BaseDAO<Comment> implements CommentDAO {

    private String[] columns =
            new String[]{"user_id", "user_name", "article_id", "context"};
    private String[] allColumns =
            new String[]{"id", "user_id", "user_name", "article_id", "context", "is_deleted", "create_time"};


    @Override
    public Long insert(Comment comment) throws SQLException {
        if (Objects.isNull(comment)
                || Objects.isNull(comment.getUserId())
                || Objects.isNull(comment.getUserName())
                || Objects.isNull(comment.getArticleId())
                || Objects.isNull(comment.getContext())) {
            return -1L;
        }


        return super.insert(columns,
                comment.getUserId(), comment.getUserName(), comment.getArticleId(), comment.getContext());
    }

    @Override
    public int update(Comment comment) throws SQLException {
        if (Objects.isNull(comment)
                || Objects.isNull(comment.getId())
                || Objects.isNull(comment.getUserId())
                || Objects.isNull(comment.getUserName())
                || Objects.isNull(comment.getArticleId())
                || Objects.isNull(comment.getContext())) {
            return -1;
        }


        return super.update(columns, "id=?",
                comment.getUserId(),
                comment.getUserName(),
                comment.getArticleId(),
                comment.getContext(),
                comment.getId());
    }

    @Override
    public int delete(Long id) throws SQLException {
        if (Objects.isNull(id)) {
            return -1;
        }
        return super.delete("id=?", id);
    }

    @Override
    public Comment findById(Long id) throws SQLException {
        if (Objects.isNull(id)) {
            return null;
        }
        return super.query(allColumns, "id=? and is_deleted != ?",
                new BeanHandler<Comment>(Comment.class,
                        new BasicRowProcessor(new GenerousBeanProcessor()))
                , id, Status.DELETED.getCode());
    }

    @Override
    public List<Comment> findAll() throws SQLException {
        return super.queryAll(allColumns, "is_deleted != ?",
                new BeanListHandler<Comment>(Comment.class,
                        new BasicRowProcessor(new GenerousBeanProcessor())),
                "id asc", Status.DELETED.getCode());
    }

    @Override
    public Page findAll(Integer page, Integer size) throws SQLException {
        return super.queryAll(allColumns, "is_deleted != ?",
                new BeanListHandler<Comment>(Comment.class,
                        new BasicRowProcessor(new GenerousBeanProcessor()))
                , page, size
                , "id asc", Status.DELETED.getCode());
    }

    @Override
    public String getTableName() {
        return "comment";
    }


    @Override
    public List<Comment> findByAId(Long aId) throws SQLException {
        return super.queryAll(allColumns, "is_deleted != ? and article_id = ? ",
                new BeanListHandler<Comment>(Comment.class,
                        new BasicRowProcessor(new GenerousBeanProcessor())),
                "create_time asc", Status.DELETED.getCode(), aId);
    }

//    public static void main(String[] args) throws Exception {
//
//        UserDAO userDAO = new UserDAOImpl();
//        User user = userDAO.findById(1L);
//        ArticleDAO articleDAO = new ArticleDAOImpl();
//        Article article = articleDAO.findById(1L);
//
//        Comment comment = new Comment(
//                user.getId(),
//                user.getName(),
//                article.getId(),
//                "写的真是不错"
//        );
//        CommentDAO commentDAO = new CommentDAOImpl();
//        Long id = commentDAO.insert(comment);
//        Comment comment1 = commentDAO.findById(id);
//        comment1.setContext("我写的真是不错");
//
//        commentDAO.update(comment1);
//        System.out.println(commentDAO.findAll(1, 10));
//        commentDAO.delete(id);
//        System.out.println(commentDAO.findAll(1, 10));
//
//    }

}

