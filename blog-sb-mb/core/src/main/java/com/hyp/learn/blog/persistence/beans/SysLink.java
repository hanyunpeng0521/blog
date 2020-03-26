package com.hyp.learn.blog.persistence.beans;

import com.hyp.learn.blog.framework.object.AbstractDO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class SysLink extends AbstractDO {
    private String url;
    private String name;
    private String description;
    private String email;
    private String qq;
    private String favicon;
    private Boolean status;
    private Boolean homePageDisplay;
    private String remark;
    private String source;
}
