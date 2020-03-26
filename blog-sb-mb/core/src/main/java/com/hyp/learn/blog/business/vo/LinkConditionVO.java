package com.hyp.learn.blog.business.vo;

import com.hyp.learn.blog.business.entity.Link;
import com.hyp.learn.blog.framework.object.BaseConditionVO;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = false)
public class LinkConditionVO extends BaseConditionVO {
    private Link link;
    private Integer status;
    private Integer homePageDisplay;

    public LinkConditionVO() {
    }

    public LinkConditionVO(Integer status, Integer homePageDisplay) {
        this.status = status;
        this.homePageDisplay = homePageDisplay;
    }
}

