package com.hyp.blog.service;

import com.hyp.blog.commons.service.BaseService;
import com.hyp.blog.pojo.User;

import java.sql.SQLException;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.service
 * hyp create at 19-12-12
 **/
public interface UserService extends BaseService<User, Long> {
    User register(User user) throws SQLException;

    User login(User user) throws SQLException;
}
