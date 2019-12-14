package com.hyp.blog.commons.dao;

import com.hyp.blog.commons.Page;

import java.sql.SQLException;
import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.dao
 * hyp create at 19-12-11
 **/
public interface CommonBaseDAO<T, K> {


    K insert(T t) throws SQLException;

    int update(T t) throws SQLException;

    int delete(K k) throws SQLException;

    T findById(K k) throws SQLException;

    List<T> findAll() throws SQLException;

    Page findAll(Integer page, Integer size) throws SQLException;

}
