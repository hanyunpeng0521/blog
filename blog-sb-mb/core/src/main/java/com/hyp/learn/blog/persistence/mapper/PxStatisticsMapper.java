package com.hyp.learn.blog.persistence.mapper;


import com.hyp.learn.blog.persistence.beans.PxStatistics;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PxStatisticsMapper {

    List<PxStatistics> listSpider();

    List<PxStatistics> listType();
}
