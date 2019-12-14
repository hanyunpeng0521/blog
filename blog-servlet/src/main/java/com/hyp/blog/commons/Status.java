package com.hyp.blog.commons;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.commons
 * hyp create at 19-12-11
 **/
public enum Status {

    /**
     *
     */
    EXISTS(0, "存在"),
    /**
     *
     */
    DELETED(1, "删除"), VISITOR(-2, "游客");

    private int code;
    private String desc;

    Status(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
