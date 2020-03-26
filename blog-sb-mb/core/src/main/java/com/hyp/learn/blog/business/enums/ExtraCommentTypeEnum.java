package com.hyp.learn.blog.business.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 额外评论类型
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.business.enums
 * hyp create at 20-3-21
 **/
@Getter
@AllArgsConstructor
public enum ExtraCommentTypeEnum {

    /**
     *
     */
    GUESTBOOK(-1L, "/guestbook", "留言板 "),
    LINKS(-2L, "/links", "友情链接 "),
    ABOUT(-3L, "/about", "关于"),
    ARTICLE(null, "/article/", ""),
    ;

    private Long sid;
    private String url;
    private String title;


    public static ExtraCommentTypeEnum getBySid(Long sid) {
        if (sid == null) {
            return null;
        }
        for (ExtraCommentTypeEnum value : ExtraCommentTypeEnum.values()) {
            if (sid.equals(value.getSid())) {
                return value;
            }
        }
        return ARTICLE;
    }


}
