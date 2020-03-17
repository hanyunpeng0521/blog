package com.hyp.learn.blog.service;

import com.hyp.learn.blog.entity.Comment;

import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.service
 * hyp create at 20-2-2
 **/
public interface CommentService {
    List<Comment> listCommentByBlogId(Long blogId);

    Comment saveComment(Comment comment);
}
