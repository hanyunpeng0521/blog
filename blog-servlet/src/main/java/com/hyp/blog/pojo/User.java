package com.hyp.blog.pojo;


import java.io.Serializable;
import java.sql.Timestamp;

public class User implements Serializable {

    private long id;
    private String name;
    private String passwd;
    private int isDeleted;
    private java.sql.Timestamp createTime;
    private java.sql.Timestamp birthday;

    public User() {
    }

    public User(String name, String passwd, Timestamp createTime) {
        this.name = name;
        this.passwd = passwd;
        this.createTime = createTime;
    }

    public User(long id, String name, String passwd, int isDeleted, Timestamp createTime, Timestamp birthday) {
        this.id = id;
        this.name = name;
        this.passwd = passwd;
        this.isDeleted = isDeleted;
        this.createTime = createTime;
        this.birthday = birthday;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }


    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }


    public java.sql.Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(java.sql.Timestamp createTime) {
        this.createTime = createTime;
    }


    public java.sql.Timestamp getBirthday() {
        return birthday;
    }

    public void setBirthday(java.sql.Timestamp birthday) {
        this.birthday = birthday;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", passwd='" + passwd + '\'' +
                ", isDeleted=" + isDeleted +
                ", createTime=" + createTime +
                ", birthday=" + birthday +
                '}';
    }
}
