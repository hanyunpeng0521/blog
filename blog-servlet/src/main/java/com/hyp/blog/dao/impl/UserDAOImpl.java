package com.hyp.blog.dao.impl;

import com.hyp.blog.commons.Page;
import com.hyp.blog.commons.Status;
import com.hyp.blog.commons.dao.BaseDAO;
import com.hyp.blog.dao.UserDAO;
import com.hyp.blog.pojo.User;
import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.GenerousBeanProcessor;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.lang3.StringUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.dao.impl
 * hyp create at 19-12-11
 **/
public class UserDAOImpl extends BaseDAO<User> implements UserDAO {
    private String[] columns =
            new String[]{"name", "passwd", "birthday"};
    private String[] allColumns =
            new String[]{"id", "name", "passwd", "birthday", "is_deleted", "create_time"};

    @Override
    public String getTableName() {
        return "user";
    }

    @Override
    public Long insert(User user) throws SQLException {
        if (Objects.isNull(user)
                || Objects.isNull(user.getName())
                || Objects.isNull(user.getPasswd())) {
            return -1L;
        }


        return super.insert(columns,
                user.getName(), user.getPasswd(), user.getBirthday());
    }

    @Override
    public int update(User user) throws SQLException {
        if (Objects.isNull(user)
                || Objects.isNull(user.getId())) {
            return -1;
        }
        return super.update(columns, "id=?",
                user.getName(),
                user.getPasswd(),
                user.getBirthday(),
                user.getId());
    }

    @Override
    public int delete(Long id) throws SQLException {
        if (Objects.isNull(id)) {
            return -1;
        }
        return super.delete("id=?", id);
    }

    @Override
    public User findById(Long id) throws SQLException {
        if (Objects.isNull(id)) {
            return null;
        }
        return super.query(allColumns, "id=? and is_deleted != ?",
                new BeanHandler<User>(User.class,
                        new BasicRowProcessor(new GenerousBeanProcessor()))
                , id, Status.DELETED.getCode());
    }

    @Override
    public List<User> findAll() throws SQLException {
        return super.queryAll(allColumns, "is_deleted != ?",
                new BeanListHandler<User>(User.class,
                        new BasicRowProcessor(new GenerousBeanProcessor())),
                "id asc", Status.DELETED.getCode());
    }

    @Override
    public Page findAll(Integer page, Integer size) throws SQLException {

        return super.queryAll(allColumns, "is_deleted != ?",
                new BeanListHandler<User>(User.class,
                        new BasicRowProcessor(new GenerousBeanProcessor()))
                , page, size
                , "id asc", Status.DELETED.getCode());
    }


    @Override
    public User findByName(String name) throws SQLException {
        if (StringUtils.isEmpty(name)) {
            return null;
        }
        return super.query(allColumns, "name = ? and is_deleted != ?",
                new BeanHandler<User>(User.class,
                        new BasicRowProcessor(new GenerousBeanProcessor()))
                , name, Status.DELETED.getCode());
    }

//        public static void main(String[] args) throws Exception {
//
//        UserDAO dao=new UserDAOImpl();
//            System.out.println(dao.findByName("pingxin"));
//        User user = new User(
//                "pingxin",
//                "12346",
//                Timestamp.valueOf("1999-5-21 00:00:00")
//        );
//        UserDAO userDao = new UserDAOImpl();
//        Long id = userDao.insert(user);
//
//        User user1 = userDao.findById(id);
//        user1.setName("hyp");
//        userDao.update(user1);
//        System.out.println(userDao.findAll(1, 10));
//        userDao.delete(id);
//        System.out.println(userDao.findAll(1, 10));

//    }
}
