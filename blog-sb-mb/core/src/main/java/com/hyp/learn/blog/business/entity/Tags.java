package com.hyp.learn.blog.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hyp.learn.blog.persistence.beans.PxTags;

import java.util.Date;


public class Tags {
    private PxTags pxTags;

    public Tags() {
        this.pxTags = new PxTags();
    }

    public Tags(PxTags pxTags) {
        this.pxTags = pxTags;
    }

    @JsonIgnore
    public PxTags getPxTags() {
        return this.pxTags;
    }

    public Long getId() {
        return this.pxTags.getId();
    }

    public void setId(Long id) {
        this.pxTags.setId(id);
    }

    public String getName() {
        return this.pxTags.getName();
    }

    public void setName(String name) {
        this.pxTags.setName(name);
    }

    public String getDescription() {
        return this.pxTags.getDescription();
    }

    public void setDescription(String description) {
        this.pxTags.setDescription(description);
    }

    public Date getCreateTime() {
        return this.pxTags.getCreateTime();
    }

    public void setCreateTime(Date createTime) {
        this.pxTags.setCreateTime(createTime);
    }

    public Date getUpdateTime() {
        return this.pxTags.getUpdateTime();
    }

    public void setUpdateTime(Date updateTime) {
        this.pxTags.setUpdateTime(updateTime);
    }

}

