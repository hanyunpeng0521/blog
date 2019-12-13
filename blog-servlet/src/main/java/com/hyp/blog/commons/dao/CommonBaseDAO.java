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


    public K insert(T t) throws SQLException;

    public int update(T t) throws SQLException;

    public int delete(K k) throws SQLException;

    public T findById(K k) throws SQLException;

    public List<T> findAll() throws SQLException;

    public Page findAll(Integer page, Integer size) throws SQLException;

}
