package com.hyp.blog.service.impl;

import com.hyp.blog.commons.service.BaseServiceImpl;
import com.hyp.blog.dao.ClassifyDAO;
import com.hyp.blog.dao.impl.ClassifyDAOImpl;
import com.hyp.blog.pojo.Classify;
import com.hyp.blog.service.ClassifyService;

import java.sql.SQLException;
import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.service.impl
 * hyp create at 19-12-12
 **/
public class ClassifyServiceImpl extends BaseServiceImpl<Classify, Long> implements ClassifyService {
    private ClassifyDAO classifyDAO;

    public ClassifyServiceImpl() {
        classifyDAO = new ClassifyDAOImpl();
        super.setBaseDAO(classifyDAO);
    }

    @Override
    public List<Classify> findByUId(Long uid) throws SQLException {
        return classifyDAO.findByUId(uid);
    }

    @Override
    public Classify findByUIdAndName(Long uid, String name) throws SQLException {
        return classifyDAO.findByUIdAndName(uid, name);
    }
}
