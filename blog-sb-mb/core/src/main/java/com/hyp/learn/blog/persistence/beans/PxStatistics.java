package com.hyp.learn.blog.persistence.beans;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;

/**
 * 统计
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PxStatistics {
    @Transient
    private String name;
    @Transient
    private Integer value;
}
