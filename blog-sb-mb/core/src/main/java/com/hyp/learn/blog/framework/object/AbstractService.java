package com.hyp.learn.blog.framework.object;

import java.util.List;

/**
 * 服务基类接口
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.object
 * hyp create at 20-3-18
 **/
public interface AbstractService<T, PK> {

    T insert(T entity);

    default void insertList(List<T> entities) {

    }

    boolean removeByPrimaryKey(PK primaryKey);

    boolean updateSelective(T entity);

    T getByPrimaryKey(PK primaryKey);

    default List<T> listAll() {
        return null;
    }
}
