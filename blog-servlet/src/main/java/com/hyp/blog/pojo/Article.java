package com.hyp.blog.pojo;


import java.io.Serializable;
import java.sql.Timestamp;

public class Article implements Serializable {

    private long id;
    private String title;
    private String context;
    private java.sql.Timestamp createTime;
    private java.sql.Timestamp modifiedTime;
    private long isDeleted;
    private long userId;
    private String userName;
    private long clzId;
    private String clzName;

    public Article() {
    }

    public Article(String title, String context, long userId, String userName) {
        this.title = title;
        this.context = context;
        this.userId = userId;
        this.userName = userName;
    }

    public Article(String title, String context, long userId, String userName, long clzId, String clzName) {
        this.title = title;
        this.context = context;
        this.userId = userId;
        this.userName = userName;
        this.clzId = clzId;
        this.clzName = clzName;
    }

    public Article(long id, String title, String context, Timestamp createTime, Timestamp modifiedTime, long isDeleted, long userId, String userName, long clzId, String clzName) {
        this.id = id;
        this.title = title;
        this.context = context;
        this.createTime = createTime;
        this.modifiedTime = modifiedTime;
        this.isDeleted = isDeleted;
        this.userId = userId;
        this.userName = userName;
        this.clzId = clzId;
        this.clzName = clzName;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", context='" + context + '\'' +
                ", createTime=" + createTime +
                ", modifiedTime=" + modifiedTime +
                ", isDeleted=" + isDeleted +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", clzId=" + clzId +
                ", clzName='" + clzName + '\'' +
                '}';
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }


    public java.sql.Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(java.sql.Timestamp createTime) {
        this.createTime = createTime;
    }


    public java.sql.Timestamp getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(java.sql.Timestamp modifiedTime) {
        this.modifiedTime = modifiedTime;
    }


    public long getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(long isDeleted) {
        this.isDeleted = isDeleted;
    }


    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    public long getClzId() {
        return clzId;
    }

    public void setClzId(long clzId) {
        this.clzId = clzId;
    }


    public String getClzName() {
        return clzName;
    }

    public void setClzName(String clzName) {
        this.clzName = clzName;
    }
}
