package com.hyp.learn.blog.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hyp.learn.blog.persistence.beans.PxArticleLove;

import java.util.Date;


public class ArticleLove {
    private static final long serialVersionUID = 1L;
    private PxArticleLove pxArticleLove;

    public ArticleLove() {
        this.pxArticleLove = new PxArticleLove();
    }

    public ArticleLove(PxArticleLove pxArticleLove) {
        this.pxArticleLove = pxArticleLove;
    }

    @JsonIgnore
    public PxArticleLove getPxArticleLove() {
        return this.pxArticleLove;
    }

    public Long getId() {
        return this.pxArticleLove.getId();
    }

    public void setId(Long id) {
        this.pxArticleLove.setId(id);
    }

    public long getArticleId() {
        return this.pxArticleLove.getArticleId();
    }

    public void setArticleId(long articleId) {
        this.pxArticleLove.setArticleId(articleId);
    }

    public long getUserId() {
        return this.pxArticleLove.getUserId();
    }

    public void setUserId(long userId) {
        this.pxArticleLove.setUserId(userId);
    }

    public String getUserIp() {
        return this.pxArticleLove.getUserIp();
    }

    public void setUserIp(String userIp) {
        this.pxArticleLove.setUserIp(userIp);
    }

    public Date getLoveTime() {
        return this.pxArticleLove.getLoveTime();
    }

    public void setLoveTime(Date loveTime) {
        this.pxArticleLove.setLoveTime(loveTime);
    }

    public Date getCreateTime() {
        return this.pxArticleLove.getCreateTime();
    }

    public void setCreateTime(Date createTime) {
        this.pxArticleLove.setCreateTime(createTime);
    }

    public Date getUpdateTime() {
        return this.pxArticleLove.getUpdateTime();
    }

    public void setUpdateTime(Date updateTime) {
        this.pxArticleLove.setUpdateTime(updateTime);
    }

}

