package com.hyp.blog.service;

import com.hyp.blog.commons.service.BaseService;
import com.hyp.blog.pojo.Comment;

import java.sql.SQLException;
import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.service
 * hyp create at 19-12-12
 **/
public interface CommentService extends BaseService<Comment, Long> {
    public List<Comment> findByAId(Long aId) throws SQLException;
}
