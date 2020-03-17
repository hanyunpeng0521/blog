package com.hyp.learn.blog.service;

import com.hyp.learn.blog.entity.User;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.service
 * hyp create at 20-2-2
 **/
public interface UserService {
    User checkUser(String username, String password);
}
