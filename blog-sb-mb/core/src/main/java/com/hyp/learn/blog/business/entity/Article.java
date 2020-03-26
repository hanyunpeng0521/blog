package com.hyp.learn.blog.business.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hyp.learn.blog.business.enums.ArticleStatusEnum;
import com.hyp.learn.blog.persistence.beans.PxArticle;
import com.hyp.learn.blog.persistence.beans.PxTags;
import com.hyp.learn.blog.persistence.beans.PxType;

import java.util.Date;
import java.util.List;


public class Article {
    private PxArticle pxArticle;

    public Article() {
        this.pxArticle = new PxArticle();
    }

    public Article(PxArticle pxArticle) {
        this.pxArticle = pxArticle;
    }

    @JsonIgnore
    public PxArticle getPxArticle() {
        return this.pxArticle;
    }

    public Long getId() {
        return this.pxArticle.getId();
    }

    public void setId(Long id) {
        this.pxArticle.setId(id);
    }

    public String getTitle() {
        return this.pxArticle.getTitle();
    }

    public void setTitle(String title) {
        this.pxArticle.setTitle(title);
    }

    public long getUserId() {
        return this.pxArticle.getUserId();
    }

    public void setUserId(long userId) {
        this.pxArticle.setUserId(userId);
    }

    public String getCoverImage() {
        return this.pxArticle.getCoverImage();
    }

    public void setCoverImage(String coverImage) {
        this.pxArticle.setCoverImage(coverImage);
    }

    public String getQrcodePath() {
        return this.pxArticle.getQrcodePath();
    }

    public void setQrcodePath(String qrcodePath) {
        this.pxArticle.setQrcodePath(qrcodePath);
    }

    public boolean getIsMarkdown() {
        Boolean value = this.pxArticle.getIsMarkdown();
        return null == value ? false : value;
    }

    public void setIsMarkdown(boolean isMarkdown) {
        this.pxArticle.setIsMarkdown(isMarkdown);
    }

    public String getContent() {
        return this.pxArticle.getContent();
    }

    public void setContent(String content) {
        this.pxArticle.setContent(content);
    }

    public String getContentMd() {
        return this.pxArticle.getContentMd();
    }

    public void setContentMd(String contentMd) {
        this.pxArticle.setContentMd(contentMd);
    }

    public boolean isTop() {
        Boolean value = this.pxArticle.getTop();
        return value != null ? value : false;
    }

    public void setTop(boolean top) {
        this.pxArticle.setTop(top);
    }


    public Long getTypeId() {
        return this.pxArticle.getTypeId();
    }

    public void setTypeId(Long type) {
        this.pxArticle.setTypeId(type);
    }

    public ArticleStatusEnum getStatusEnum() {
        return ArticleStatusEnum.get(this.pxArticle.getStatus());
    }

    public Integer getStatus() {
        return this.pxArticle.getStatus();
    }

    public void setStatus(Integer type) {
        this.pxArticle.setStatus(type);
    }

    public boolean getRecommended() {
        Boolean value = this.pxArticle.getRecommended();
        return value == null ? false : value;
    }

    public void setRecommended(Boolean value) {
        this.pxArticle.setRecommended(value);
    }

    public boolean isOriginal() {
        Boolean value = this.pxArticle.getOriginal();
        return value != null ? value : false;
    }

    public void setOriginal(boolean original) {
        this.pxArticle.setOriginal(original);
    }


    public String getDescription() {
        return this.pxArticle.getDescription();
    }

    public void setDescription(String description) {
        this.pxArticle.setDescription(description);
    }

    public String getKeywords() {
        return this.pxArticle.getKeywords();
    }

    public void setKeywords(String keywords) {
        this.pxArticle.setKeywords(keywords);
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
    public Date getCreateTime() {
        return this.pxArticle.getCreateTime();
    }

    public void setCreateTime(Date createTime) {
        this.pxArticle.setCreateTime(createTime);
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
    public Date getUpdateTime() {
        return this.pxArticle.getUpdateTime();
    }

    public void setUpdateTime(Date updateTime) {
        this.pxArticle.setUpdateTime(updateTime);
    }

    public boolean isComment() {
        Boolean value = this.pxArticle.getComment();
        return value != null ? value : false;
    }

    public void setComment(boolean comment) {
        this.pxArticle.setComment(comment);
    }

    public List<PxTags> getTags() {
        return this.pxArticle.getTags();
    }

    public PxType getType() {
        return this.pxArticle.getPxType();
    }

    public int getLookCount() {
        Integer lookCount = this.pxArticle.getLookCount();
        return lookCount == null ? 0 : lookCount;
    }

    public int getCommentCount() {
        Integer commentCount = this.pxArticle.getCommentCount();
        return commentCount == null ? 0 : commentCount;
    }

    public int getLoveCount() {
        Integer loveCount = this.pxArticle.getLoveCount();
        return loveCount == null ? 0 : loveCount;
    }
}

