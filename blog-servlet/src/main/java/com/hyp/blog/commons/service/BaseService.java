package com.hyp.blog.commons.service;

import com.hyp.blog.commons.Page;

import java.sql.SQLException;
import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.service
 * hyp create at 19-12-12
 **/
public interface BaseService<T, K> {
    public K save(T entity) throws SQLException;// 保存

    public int delete(K id) throws SQLException;// 删除

    public int update(T entity) throws SQLException;// 更新

    public T findById(K id) throws SQLException;// 根据主键查找

    public List<T> getAll() throws SQLException;// 查看所有

    public Page getAll(int page, int size) throws SQLException;// 查看分页

}
