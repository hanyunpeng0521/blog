package com.hyp.learn.blog.persistence.beans;

import com.hyp.learn.blog.framework.object.AbstractDO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PxArticleLove extends AbstractDO {
    private Long articleId;
    private Long userId;
    private String userIp;
    private Date loveTime;
}
