package com.hyp.learn.blog.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hyp.learn.blog.persistence.beans.PxStatistics;


public class Statistics {

    private PxStatistics pxStatistics;

    public Statistics(PxStatistics pxStatistics) {
        this.pxStatistics = pxStatistics;
    }

    public Statistics() {
    }

    @JsonIgnore
    public PxStatistics getPxStatistics() {
        return pxStatistics;
    }

    public String getName() {
        return this.pxStatistics.getName();
    }

    public void setName(String name) {
        this.pxStatistics.setName(name);
    }

    public Integer getValue() {
        return this.pxStatistics.getValue();
    }

    public void setValue(Integer value) {
        this.pxStatistics.setValue(value);
    }
}
