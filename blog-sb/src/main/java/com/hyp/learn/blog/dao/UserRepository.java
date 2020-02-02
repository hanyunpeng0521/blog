package com.hyp.learn.blog.dao;

import com.hyp.learn.blog.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.dao
 * hyp create at 20-2-2
 **/
public interface UserRepository extends JpaRepository<User,Long> {

    User findByUsernameAndPassword(String username, String password);
}
