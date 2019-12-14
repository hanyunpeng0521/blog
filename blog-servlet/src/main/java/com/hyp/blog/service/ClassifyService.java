package com.hyp.blog.service;

import com.hyp.blog.commons.service.BaseService;
import com.hyp.blog.pojo.Classify;

import java.sql.SQLException;
import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.service
 * hyp create at 19-12-12
 **/
public interface ClassifyService extends BaseService<Classify, Long> {
    List<Classify> findByUId(Long uid) throws SQLException;

    Classify findByUIdAndName(Long uid, String name) throws SQLException;
}
