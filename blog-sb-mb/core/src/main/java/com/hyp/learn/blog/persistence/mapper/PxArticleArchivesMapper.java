package com.hyp.learn.blog.persistence.mapper;

import com.hyp.learn.blog.persistence.beans.PxArticleArchives;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PxArticleArchivesMapper {

    List<PxArticleArchives> listArchives();
}
