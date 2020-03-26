package com.hyp.learn.blog.persistence.beans;

import com.hyp.learn.blog.framework.object.AbstractDO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;
import java.util.List;

/**
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PxType extends AbstractDO {
    private Long pid;
    private String name;
    private String description;
    private Integer sort;
    private Boolean available;
    private String icon;


    @Transient
    private PxType parent;
    @Transient
    private List<PxType> nodes;
}
