package com.hyp.learn.blog.persistence.mapper;

import com.hyp.learn.blog.business.vo.TagsConditionVO;
import com.hyp.learn.blog.persistence.beans.PxTags;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PxTagsMapper extends BaseMapper<PxTags> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<PxTags> findPageBreakByCondition(TagsConditionVO vo);
}
