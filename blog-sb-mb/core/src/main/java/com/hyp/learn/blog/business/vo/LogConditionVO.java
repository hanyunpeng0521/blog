package com.hyp.learn.blog.business.vo;


import com.hyp.learn.blog.framework.object.BaseConditionVO;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class LogConditionVO extends BaseConditionVO {
    private Long userId;
    private String logLevel;
    private String type;
    private Boolean spider;
}

