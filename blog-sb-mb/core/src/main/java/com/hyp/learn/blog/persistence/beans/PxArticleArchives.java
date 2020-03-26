package com.hyp.learn.blog.persistence.beans;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;

/**
 * 文章归档
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PxArticleArchives {
    @Transient
    Long id;
    @Transient
    private String title;
    @Transient
    private String original;
    @Transient
    private String datetime;
}
