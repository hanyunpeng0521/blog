package com.hyp.blog.dao;

import com.hyp.blog.commons.dao.CommonBaseDAO;
import com.hyp.blog.pojo.Classify;

import java.sql.SQLException;
import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.dao
 * hyp create at 19-12-11
 **/
public interface ClassifyDAO extends CommonBaseDAO<Classify, Long> {
    List<Classify> findByUId(Long uid) throws SQLException;

    Classify findByUIdAndName(Long uid, String name) throws SQLException;

}
