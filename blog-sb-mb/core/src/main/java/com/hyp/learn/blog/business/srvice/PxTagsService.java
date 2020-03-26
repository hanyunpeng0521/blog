package com.hyp.learn.blog.business.srvice;

import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.entity.Tags;
import com.hyp.learn.blog.business.vo.TagsConditionVO;
import com.hyp.learn.blog.framework.object.AbstractService;

/**
 * 标签
 */
public interface PxTagsService extends AbstractService<Tags, Long> {

    PageInfo<Tags> findPageBreakByCondition(TagsConditionVO vo);

    Tags getByName(String name);
}
