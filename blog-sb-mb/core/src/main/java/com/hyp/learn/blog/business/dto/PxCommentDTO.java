package com.hyp.learn.blog.business.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hyp.learn.blog.business.enums.UserTypeEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 评论详情，用于页面传输
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PxCommentDTO {
    @JsonIgnore
    PxCommentDTO parentDTO;
    private Long id;
    @JsonIgnore
    private Date createTime;
    private Long sid;
    private Long pid;
    private String nickname;
    private String avatar;
    private String url;
    private String address;
    private String os;
    private String osShortName;
    private String browser;
    private String browserShortName;
    private String content;
    private Integer support;
    private Integer oppose;

    @JsonIgnore
    private UserTypeEnum userType;

    public boolean isRoot() {
        return null != userType && userType == UserTypeEnum.ROOT;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
    public Date getCreateTimeString() {
        return this.getCreateTime();
    }

    public PxCommentDTO getParent() {
        return this.parentDTO;
    }
}
