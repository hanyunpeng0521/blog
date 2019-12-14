package com.hyp.blog.dao;

import com.hyp.blog.commons.dao.CommonBaseDAO;
import com.hyp.blog.pojo.Comment;

import java.sql.SQLException;
import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.dao
 * hyp create at 19-12-12
 **/
public interface CommentDAO extends CommonBaseDAO<Comment, Long> {
    List<Comment> findByAId(Long aId) throws SQLException;
}
