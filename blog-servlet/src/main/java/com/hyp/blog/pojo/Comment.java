package com.hyp.blog.pojo;


import java.sql.Timestamp;

public class Comment {

  private long id;
  private long userId;
  private String userName;
  private long articleId;
  private String context;
  private java.sql.Timestamp createTime;
  private long isDeleted;

  public Comment() {
  }

  public Comment(long userId, String userName, long articleId, String context) {
    this.userId = userId;
    this.userName = userName;
    this.articleId = articleId;
    this.context = context;
  }

  public Comment(long id, long userId, String userName, long articleId, String context, Timestamp createTime, long isDeleted) {
    this.id = id;
    this.userId = userId;
    this.userName = userName;
    this.articleId = articleId;
    this.context = context;
    this.createTime = createTime;
    this.isDeleted = isDeleted;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
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


  public long getArticleId() {
    return articleId;
  }

  public void setArticleId(long articleId) {
    this.articleId = articleId;
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


  public long getIsDeleted() {
    return isDeleted;
  }

  public void setIsDeleted(long isDeleted) {
    this.isDeleted = isDeleted;
  }

  @Override
  public String toString() {
    return "Comment{" +
            "id=" + id +
            ", userId=" + userId +
            ", userName='" + userName + '\'' +
            ", articleId=" + articleId +
            ", context='" + context + '\'' +
            ", createTime=" + createTime +
            ", isDeleted=" + isDeleted +
            '}';
  }
}
