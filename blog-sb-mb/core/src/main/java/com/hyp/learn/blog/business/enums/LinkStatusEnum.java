package com.hyp.learn.blog.business.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 友情链接是否可用
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.business.enums
 * hyp create at 20-3-21
 **/
@AllArgsConstructor
@Getter
public enum LinkStatusEnum {
    /**
     *
     */
    ENABLE("可用"),
    DISABLE("禁用");
    private String desc;

}

