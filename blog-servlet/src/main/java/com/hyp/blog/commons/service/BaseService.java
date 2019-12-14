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
    K save(T entity) throws SQLException;// 保存

    int delete(K id) throws SQLException;// 删除

    int update(T entity) throws SQLException;// 更新

    T findById(K id) throws SQLException;// 根据主键查找

    List<T> getAll() throws SQLException;// 查看所有

    Page getAll(int page, int size) throws SQLException;// 查看分页

}
