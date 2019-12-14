package com.hyp.blog.dao;

import com.hyp.blog.commons.dao.CommonBaseDAO;
import com.hyp.blog.pojo.User;

import java.sql.SQLException;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.dao
 * hyp create at 19-12-11
 **/
public interface UserDAO extends CommonBaseDAO<User, Long> {

    User findByName(String name) throws SQLException;

}
