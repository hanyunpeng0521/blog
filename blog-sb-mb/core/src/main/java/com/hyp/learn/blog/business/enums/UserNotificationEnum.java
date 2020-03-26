package com.hyp.learn.blog.business.enums;

/**
 * 用户`通知类型
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.business.enums
 * hyp create at 20-3-22
 **/
public enum UserNotificationEnum {
    /**
     *
     */
    DETAIL(1, "通知显示消息详情"),
    TITLE(2, "通知不显示消息详情"),
    ;
    private Integer code;
    private String desc;

    UserNotificationEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static UserNotificationEnum get(Integer code) {
        if (null == code) {
            return DETAIL;
        }
        UserNotificationEnum[] enums = UserNotificationEnum.values();
        for (UserNotificationEnum anEnum : enums) {
            if (anEnum.getCode().equals(code)) {
                return anEnum;
            }
        }
        return DETAIL;
    }

    public Integer getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
