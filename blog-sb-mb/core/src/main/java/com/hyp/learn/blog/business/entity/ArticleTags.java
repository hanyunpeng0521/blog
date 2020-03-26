package com.hyp.learn.blog.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hyp.learn.blog.persistence.beans.PxArticleTags;

import java.util.Date;


public class ArticleTags {
    private static final long serialVersionUID = 1L;
    private PxArticleTags pxArticleTags;

    public ArticleTags() {
        this.pxArticleTags = new PxArticleTags();
    }

    public ArticleTags(PxArticleTags pxArticleTags) {
        this.pxArticleTags = pxArticleTags;
    }

    @JsonIgnore
    public PxArticleTags getPxArticleTags() {
        return this.pxArticleTags;
    }

    public Long getId() {
        return this.pxArticleTags.getId();
    }

    public void setId(Long id) {
        this.pxArticleTags.setId(id);
    }

    public long getTagId() {
        return this.pxArticleTags.getTagId();
    }

    public void setTagId(long tagId) {
        this.pxArticleTags.setTagId(tagId);
    }

    public long getArticleId() {
        return this.pxArticleTags.getArticleId();
    }

    public void setArticleId(long articleId) {
        this.pxArticleTags.setArticleId(articleId);
    }

    public Date getCreateTime() {
        return this.pxArticleTags.getCreateTime();
    }

    public void setCreateTime(Date createTime) {
        this.pxArticleTags.setCreateTime(createTime);
    }

    public Date getUpdateTime() {
        return this.pxArticleTags.getUpdateTime();
    }

    public void setUpdateTime(Date updateTime) {
        this.pxArticleTags.setUpdateTime(updateTime);
    }

}

