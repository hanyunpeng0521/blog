package com.hyp.learn.blog.business.srvice;


import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.entity.Comment;
import com.hyp.learn.blog.business.vo.CommentConditionVO;
import com.hyp.learn.blog.framework.exception.PxCommentException;
import com.hyp.learn.blog.framework.object.AbstractService;

import java.util.List;
import java.util.Map;

/**
 * 评论
 */
public interface PxCommentService extends AbstractService<Comment, Long> {

    PageInfo<Comment> findPageBreakByCondition(CommentConditionVO vo);

    Map<String, Object> list(CommentConditionVO vo);

    /**
     * admin发表评论
     *
     * @param comment
     * @return
     */
    void commentForAdmin(Comment comment) throws PxCommentException;

    /**
     * 发表评论
     *
     * @param comment
     * @return
     */
    Comment comment(Comment comment) throws PxCommentException;

    /**
     * 查询近期评论
     *
     * @param pageSize
     * @return
     */
    List<Comment> listRecentComment(int pageSize);

    /**
     * 查询未审核的评论
     *
     * @param pageSize
     * @return
     */
    List<Comment> listVerifying(int pageSize);

    /**
     * 点赞
     *
     * @param id
     */
    void doSupport(Long id);

    /**
     * 点踩
     *
     * @param id
     */
    void doOppose(Long id);
}
