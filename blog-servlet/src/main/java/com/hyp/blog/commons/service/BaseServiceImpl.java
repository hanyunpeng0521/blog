package com.hyp.blog.commons.service;

import com.hyp.blog.commons.Page;
import com.hyp.blog.commons.dao.CommonBaseDAO;
import com.hyp.blog.commons.service.BaseService;

import java.sql.SQLException;
import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.service.impl
 * hyp create at 19-12-12
 **/
public class BaseServiceImpl<T, K> implements BaseService<T, K> {

    private CommonBaseDAO<T, K> baseDAO;

    public CommonBaseDAO<T, K> getBaseDAO() {
        return baseDAO;
    }

    public void setBaseDAO(CommonBaseDAO<T, K> baseDAO) {
        this.baseDAO = baseDAO;
    }

    @Override
    public K save(T entity) throws SQLException {
        return baseDAO.insert(entity);
    }

    @Override
    public int delete(K id) throws SQLException {
        return baseDAO.delete(id);
    }

    @Override
    public int update(T entity) throws SQLException {
        return baseDAO.update(entity);
    }

    @Override
    public T findById(K id) throws SQLException {
        return baseDAO.findById(id);
    }


    @Override
    public List<T> getAll() throws SQLException {
        return baseDAO.findAll();
    }

    @Override
    public Page getAll(int page, int size) throws SQLException {
        return baseDAO.findAll(page, size);
    }
}
