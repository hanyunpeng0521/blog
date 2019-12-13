package com.hyp.blog.service.impl;

import com.hyp.blog.commons.service.BaseServiceImpl;
import com.hyp.blog.dao.CommentDAO;
import com.hyp.blog.dao.impl.CommentDAOImpl;
import com.hyp.blog.pojo.Comment;
import com.hyp.blog.service.CommentService;

import java.sql.SQLException;
import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.service.impl
 * hyp create at 19-12-12
 **/
public class CommentServiceImpl extends BaseServiceImpl<Comment, Long> implements CommentService {
    private CommentDAO commentDAO;

    public CommentServiceImpl() {
        commentDAO = new CommentDAOImpl();
        super.setBaseDAO(commentDAO);
    }

    @Override
    public List<Comment> findByAId(Long aId) throws SQLException {
        return commentDAO.findByAId(aId);
    }
}
