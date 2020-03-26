package com.hyp.learn.blog.business.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 资源类型
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.business.enums
 * hyp create at 20-3-21
 **/
@AllArgsConstructor
@Getter
public enum ResourceTypeEnum {
    /**
     * 菜单
     */
    menu("菜单"),
    /**
     * 按钮
     */
    button("按钮");

    private final String info;

}
