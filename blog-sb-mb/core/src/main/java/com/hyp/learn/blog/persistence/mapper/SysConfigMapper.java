package com.hyp.learn.blog.persistence.mapper;


import com.hyp.learn.blog.persistence.beans.SysConfig;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public interface SysConfigMapper extends BaseMapper<SysConfig> {
    Map<String, Object> getSiteInfo();
}
