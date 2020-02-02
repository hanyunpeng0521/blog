package com.hyp.learn.blog.service.impl;

import com.hyp.learn.blog.dao.UserRepository;
import com.hyp.learn.blog.entity.User;
import com.hyp.learn.blog.service.UserService;
import com.hyp.learn.blog.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.service.impl
 * hyp create at 20-2-2
 **/
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User checkUser(String username, String password) {
        User user = userRepository.findByUsernameAndPassword(username, MD5Utils.code(password));
        return user;
    }
}
