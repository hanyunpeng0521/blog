package com.hyp.learn.blog.persistence.beans;

import com.hyp.learn.blog.framework.object.AbstractDO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;


@Data
@EqualsAndHashCode(callSuper = false)
public class PxArticleLook extends AbstractDO {
    private Long articleId;
    private Long userId;
    private String userIp;
    private Date lookTime;
}
