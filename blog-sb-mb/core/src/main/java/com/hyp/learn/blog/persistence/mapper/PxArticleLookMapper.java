package com.hyp.learn.blog.persistence.mapper;


import com.hyp.learn.blog.business.vo.ArticleLookConditionVO;
import com.hyp.learn.blog.persistence.beans.PxArticleLook;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PxArticleLookMapper extends BaseMapper<PxArticleLook> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<PxArticleLook> findPageBreakByCondition(ArticleLookConditionVO vo);
}
