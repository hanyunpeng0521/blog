package com.hyp.learn.blog.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hyp.learn.blog.persistence.beans.PxArticleLook;

import java.util.Date;

public class ArticleLook {
    private static final long serialVersionUID = 1L;
    private PxArticleLook pxArticleLook;

    public ArticleLook() {
        this.pxArticleLook = new PxArticleLook();
    }

    public ArticleLook(PxArticleLook pxArticleLook) {
        this.pxArticleLook = pxArticleLook;
    }

    @JsonIgnore
    public PxArticleLook getPxArticleLook() {
        return this.pxArticleLook;
    }

    public Long getId() {
        return this.pxArticleLook.getId();
    }

    public void setId(Long id) {
        this.pxArticleLook.setId(id);
    }

    public long getArticleId() {
        return this.pxArticleLook.getArticleId();
    }

    public void setArticleId(Long articleId) {
        this.pxArticleLook.setArticleId(articleId);
    }

    public Long getUserId() {
        return this.pxArticleLook.getUserId();
    }

    public void setUserId(long userId) {
        this.pxArticleLook.setUserId(userId);
    }

    public String getUserIp() {
        return this.pxArticleLook.getUserIp();
    }

    public void setUserIp(String userIp) {
        this.pxArticleLook.setUserIp(userIp);
    }

    public Date getLookTime() {
        return this.pxArticleLook.getLookTime();
    }

    public void setLookTime(Date lookTime) {
        this.pxArticleLook.setLookTime(lookTime);
    }

    public Date getCreateTime() {
        return this.pxArticleLook.getCreateTime();
    }

    public void setCreateTime(Date createTime) {
        this.pxArticleLook.setCreateTime(createTime);
    }

    public Date getUpdateTime() {
        return this.pxArticleLook.getUpdateTime();
    }

    public void setUpdateTime(Date updateTime) {
        this.pxArticleLook.setUpdateTime(updateTime);
    }

}

