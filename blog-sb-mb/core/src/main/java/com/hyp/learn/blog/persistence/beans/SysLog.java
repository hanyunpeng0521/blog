package com.hyp.learn.blog.persistence.beans;

import com.hyp.learn.blog.framework.object.AbstractDO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class SysLog extends AbstractDO {
    private Long userId;
    private String logLevel;
    private String ip;
    private String content;
    private String params;
    private String type;
    private String ua;
    private String os;
    private String browser;
    private String spiderType;
    private String requestUrl;
    private String referer;
}
