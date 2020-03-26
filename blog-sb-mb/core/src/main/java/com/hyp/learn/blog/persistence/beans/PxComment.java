package com.hyp.learn.blog.persistence.beans;

import com.hyp.learn.blog.framework.object.AbstractDO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;

/**
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PxComment extends AbstractDO {
    @Transient
    PxComment parent;
    @Transient
    PxArticle article;
    private Long userId;
    private Long sid;
    private Long pid;
    private String qq;
    private String nickname;
    private String avatar;
    private String email;
    private String url;
    private String status;
    private String ip;
    private String lng;
    private String lat;
    private String address;
    private String os;
    private String osShortName;
    private String browser;
    private String browserShortName;
    private String content;
    private String remark;
    private Integer support;
    private Integer oppose;

    @Transient
    private SysUser user;
}
