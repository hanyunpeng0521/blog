package com.hyp.learn.blog.business.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 公告状态
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.business.enums
 * hyp create at 20-3-21
 **/
@AllArgsConstructor
@Getter
public enum NoticeStatusEnum {
    /**
     *
     */
    RELEASE("已发布"),
    NOT_RELEASE("未发布");
    private String desc;

}