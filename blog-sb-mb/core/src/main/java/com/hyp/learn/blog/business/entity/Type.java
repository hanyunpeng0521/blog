package com.hyp.learn.blog.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hyp.learn.blog.persistence.beans.PxType;

import java.util.Date;
import java.util.List;


public class Type {
    private PxType pxType;

    public Type() {
        this.pxType = new PxType();
    }

    public Type(PxType pxType) {
        this.pxType = pxType;
    }

    @JsonIgnore
    public PxType getPxType() {
        return this.pxType;
    }

    public Long getId() {
        return this.pxType.getId();
    }

    public void setId(Long id) {
        this.pxType.setId(id);
    }

    public Long getPid() {
        return this.pxType.getPid();
    }

    public void setPid(Long pid) {
        this.pxType.setPid(pid);
    }

    public Long getParentId() {
        return this.pxType.getPid();
    }

    public String getName() {
        return this.pxType.getName();
    }

    public void setName(String name) {
        this.pxType.setName(name);
    }

    public String getDescription() {
        return this.pxType.getDescription();
    }

    public void setDescription(String description) {
        this.pxType.setDescription(description);
    }

    public Integer getSort() {
        return this.pxType.getSort();
    }

    public void setSort(Integer sort) {
        this.pxType.setSort(sort);
    }

    public boolean isAvailable() {
        Boolean value = this.pxType.getAvailable();
        return value != null ? value : false;
    }

    public void setAvailable(boolean available) {
        this.pxType.setAvailable(available);
    }

    public String getIcon() {
        return this.pxType.getIcon();
    }

    public void setIcon(String icon) {
        this.pxType.setIcon(icon);
    }

    public Date getCreateTime() {
        return this.pxType.getCreateTime();
    }

    public void setCreateTime(Date createTime) {
        this.pxType.setCreateTime(createTime);
    }

    public Date getUpdateTime() {
        return this.pxType.getUpdateTime();
    }

    public void setUpdateTime(Date updateTime) {
        this.pxType.setUpdateTime(updateTime);
    }

    public PxType getParent() {
        return this.pxType.getParent();
    }

    public void setParent(PxType parent) {
        this.pxType.setParent(parent);
    }

    public List<PxType> getNodes() {
        return this.pxType.getNodes();
    }

    public void setNodes(List<PxType> nodes) {
        this.pxType.setNodes(nodes);
    }

}

