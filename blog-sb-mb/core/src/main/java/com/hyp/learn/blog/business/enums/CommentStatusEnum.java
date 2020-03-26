package com.hyp.learn.blog.business.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 评论状态
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.business.enums
 * hyp create at 20-3-21
 **/
@Getter
@AllArgsConstructor
public enum CommentStatusEnum {
    /**
     *
     */
    VERIFYING("正在审核"),
    APPROVED("审核通过"),
    REJECT("审核失败"),
    DELETED("已删除");
    private String desc;

}
