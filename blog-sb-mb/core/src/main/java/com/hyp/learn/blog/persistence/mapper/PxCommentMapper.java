package com.hyp.learn.blog.persistence.mapper;

import com.hyp.learn.blog.business.vo.CommentConditionVO;
import com.hyp.learn.blog.persistence.beans.PxComment;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PxCommentMapper extends BaseMapper<PxComment> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<PxComment> findPageBreakByCondition(CommentConditionVO vo);

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

    /**
     * 获取单个评论，关联查询文章信息
     *
     * @param id
     */
    PxComment getById(Long id);
}
