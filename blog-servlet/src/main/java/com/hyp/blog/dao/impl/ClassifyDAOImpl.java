package com.hyp.blog.dao.impl;

import com.hyp.blog.commons.Page;
import com.hyp.blog.commons.Status;
import com.hyp.blog.commons.dao.BaseDAO;
import com.hyp.blog.dao.ClassifyDAO;
import com.hyp.blog.pojo.Classify;
import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.GenerousBeanProcessor;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.dao.impl
 * hyp create at 19-12-11
 **/
public class ClassifyDAOImpl extends BaseDAO<Classify> implements ClassifyDAO {
    private String[] columns =
            new String[]{"name", "level", "user_id"};
    private String[] allColumns =
            new String[]{"id", "user_id", "name", "level", "is_deleted"};


    @Override
    public Long insert(Classify classify) throws SQLException {
        if (Objects.isNull(classify)
                || Objects.isNull(classify.getName())
                || Objects.isNull(classify.getLevel())
                || Objects.isNull(classify.getUserId())) {
            return -1L;
        }


        return super.insert(columns,
                classify.getName(),
                classify.getLevel(),
                classify.getUserId());
    }

    @Override
    public int update(Classify classify) throws SQLException {
        if (Objects.isNull(classify)
                || Objects.isNull(classify.getId())
                || Objects.isNull(classify.getName())
                || Objects.isNull(classify.getLevel())
                || Objects.isNull(classify.getUserId())) {
            return -1;
        }
        return super.update(columns, "id=?",
                classify.getName(),
                classify.getLevel(),
                classify.getUserId(),
                classify.getId());
    }

    @Override
    public int delete(Long id) throws SQLException {
        if (Objects.isNull(id)) {
            return -1;
        }
        return super.delete("id=?", id);
    }

    @Override
    public Classify findById(Long id) throws SQLException {
        if (Objects.isNull(id)) {
            return null;
        }
        return super.query(allColumns, "id=? and is_deleted != ?",
                new BeanHandler<Classify>(Classify.class,
                        new BasicRowProcessor(new GenerousBeanProcessor()))
                , id, Status.DELETED.getCode());
    }

    @Override
    public List<Classify> findAll() throws SQLException {
        return super.queryAll(allColumns, "is_deleted != ?",
                new BeanListHandler<Classify>(Classify.class,
                        new BasicRowProcessor(new GenerousBeanProcessor())),
                "id asc", Status.DELETED.getCode());
    }

    @Override
    public Page findAll(Integer page, Integer size) throws SQLException {

        return super.queryAll(allColumns, "is_deleted != ?",
                new BeanListHandler<Classify>(Classify.class,
                        new BasicRowProcessor(new GenerousBeanProcessor()))
                , page, size
                , "id asc", Status.DELETED.getCode());
    }

    @Override
    public String getTableName() {
        return "classify";
    }

    @Override
    public List<Classify> findByUId(Long uid) throws SQLException {
        return super.queryAll(allColumns, "is_deleted != ? and user_id = ?",
                new BeanListHandler<Classify>(Classify.class,
                        new BasicRowProcessor(new GenerousBeanProcessor())),
                "id asc", Status.DELETED.getCode(), uid);
    }

    @Override
    public Classify findByUIdAndName(Long uid, String name) throws SQLException {
        return super.query(allColumns, "is_deleted != ? and user_id = ? and name = ?",
                new BeanHandler<Classify>(Classify.class,
                        new BasicRowProcessor(new GenerousBeanProcessor())),
                Status.DELETED.getCode(), uid, name);
    }

//    public static void main(String[] args) throws Exception {
//        Classify classify = new Classify(
//                1,
//                "java",
//                1
//        );
//        ClassifyDAO classifyDAO=new ClassifyDAOImpl();
//        Long id = classifyDAO.insert(classify);
//
//        Classify classify1 = classifyDAO.findById(id);
//        classify1.setName("java成神之路");
//        classifyDAO.update(classify1);
//        System.out.println(classifyDAO.findAll());
//        System.out.println(classifyDAO.findAll(1, 10));
//        classifyDAO.delete(id);
//        System.out.println(classifyDAO.findAll(1, 10));
//
//    }

}
