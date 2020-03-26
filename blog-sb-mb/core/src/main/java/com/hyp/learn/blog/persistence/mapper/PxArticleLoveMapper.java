package com.hyp.learn.blog.persistence.mapper;


import com.hyp.learn.blog.business.vo.ArticleLoveConditionVO;
import com.hyp.learn.blog.persistence.beans.PxArticleLove;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PxArticleLoveMapper extends BaseMapper<PxArticleLove> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<PxArticleLove> findPageBreakByCondition(ArticleLoveConditionVO vo);
}
