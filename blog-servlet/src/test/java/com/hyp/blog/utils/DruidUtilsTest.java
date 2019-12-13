package com.hyp.blog.utils;

import java.sql.SQLException;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.utils
 * hyp create at 19-12-9
 **/
public class DruidUtilsTest {

    @org.junit.Test
    public void getINSTANCE() {
        DruidUtils.getINSTANCE();
    }

    @org.junit.Test
    public void getConnection() throws SQLException {
        DruidUtils.getConnection();
    }
}