package com.hyp.blog.pojo;


public class Classify {

    private long id;
    private long userId;
    private String name;
    private long level;
    private long isDeleted;

    public Classify() {
    }

    public Classify(long userId, String name, long level) {
        this.userId = userId;
        this.name = name;
        this.level = level;
    }

    public Classify(long id, long userId, String name, long level, long isDeleted) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.level = level;
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


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public long getLevel() {
        return level;
    }

    public void setLevel(long level) {
        this.level = level;
    }


    public long getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(long isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "Classify{" +
                "id=" + id +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", level=" + level +
                ", isDeleted=" + isDeleted +
                '}';
    }
}
