package com.hyp.learn.blog.business.vo;


import com.hyp.learn.blog.business.entity.Tags;
import com.hyp.learn.blog.framework.object.BaseConditionVO;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = false)
public class TagsConditionVO extends BaseConditionVO {
    private Tags tags;
}

