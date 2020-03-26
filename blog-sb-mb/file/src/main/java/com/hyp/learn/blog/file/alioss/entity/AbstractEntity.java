package com.hyp.learn.blog.file.alioss.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.file.alioss.entity
 * hyp create at 20-3-17
 **/
@Data
@EqualsAndHashCode(callSuper = false)
public abstract class AbstractEntity {
    private String bucketName;

    public AbstractEntity() {
    }

    public AbstractEntity(String bucketName) {
        this.bucketName = bucketName;
    }
}
