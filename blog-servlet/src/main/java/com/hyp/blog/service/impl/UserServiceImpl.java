package com.hyp.blog.service.impl;

import com.hyp.blog.commons.service.BaseServiceImpl;
import com.hyp.blog.dao.UserDAO;
import com.hyp.blog.dao.impl.UserDAOImpl;
import com.hyp.blog.pojo.User;
import com.hyp.blog.service.UserService;
import org.apache.commons.lang3.StringUtils;

import java.sql.SQLException;
import java.util.Objects;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.service.impl
 * hyp create at 19-12-12
 **/
public class UserServiceImpl extends BaseServiceImpl<User, Long> implements UserService {

    private UserDAO userDAO;

    public UserServiceImpl() {
        userDAO = new UserDAOImpl();
        super.setBaseDAO(userDAO);
    }


    @Override
    public User register(User user) throws SQLException {

        User res = null;
        if (Objects.isNull(user)
                || Objects.isNull(user.getName())
                || Objects.isNull(user.getPasswd())) {
            return res;
        }
        user = userDAO.findByName(user.getName());
        if (Objects.nonNull(user) && Objects.nonNull(user.getId())) {
            return res;
        }
        Long id = userDAO.insert(user);
        res = userDAO.findById(id);

        return res;
    }

    @Override
    public User login(User user) throws SQLException {
        User res = null;
        if (Objects.isNull(user)
                || Objects.isNull(user.getName())
                || Objects.isNull(user.getPasswd())) {
            return res;
        }
        User find = userDAO.findByName(user.getName());
        if (Objects.nonNull(find) &&
                StringUtils.equals(find.getPasswd(), user.getPasswd())) {
            res = find;
        }

        return res;

    }
}
