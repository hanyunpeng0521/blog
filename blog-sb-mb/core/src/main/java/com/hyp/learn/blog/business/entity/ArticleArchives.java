package com.hyp.learn.blog.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hyp.learn.blog.persistence.beans.PxArticleArchives;

import java.util.List;


public class ArticleArchives {

    private PxArticleArchives pxArticleArchives;
    private List<Article> articleList;

    public ArticleArchives(PxArticleArchives pxArticleArchives) {
        this.pxArticleArchives = pxArticleArchives;
    }

    public ArticleArchives() {
    }

    @JsonIgnore
    public PxArticleArchives getPxArticleArchives() {
        return pxArticleArchives;
    }

    public List<Article> getArticleList() {
        return articleList;
    }

    public void setArticleList(List<Article> articleList) {
        this.articleList = articleList;
    }

    public Long getId() {
        return this.pxArticleArchives.getId();
    }

    public void setId(Long id) {
        this.pxArticleArchives.setId(id);
    }

    public String getTitle() {
        return this.pxArticleArchives.getTitle();
    }

    public void setTitle(String title) {
        this.pxArticleArchives.setTitle(title);
    }

    public String getOriginal() {
        return this.pxArticleArchives.getOriginal();
    }

    public void setOriginal(String original) {
        this.pxArticleArchives.setOriginal(original);
    }

    public String getDatetime() {
        return this.pxArticleArchives.getDatetime();
    }

    public void setDatetime(String datetime) {
        this.pxArticleArchives.setDatetime(datetime);
    }

    public String getDay() {
        String time = getDatetime();
        return time.substring(time.lastIndexOf("-") + 1);
    }
}
