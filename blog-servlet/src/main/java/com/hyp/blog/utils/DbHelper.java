package com.hyp.blog.utils;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.utils
 * hyp create at 19-12-9
 **/
public class DbHelper {

    private static String getId = "select last_insert_id()";

    private static ResultSetHandler<Integer> idRsh = new
            ResultSetHandler<Integer>() {
                @Override
                public Integer handle(ResultSet resultSet) throws SQLException {

                    return resultSet.getInt(0);
                }
            };

    /**
     * 插入，使用dbutils
     *
     * @param sql  sql语句
     * @param vals 变量
     * @return 插入返回id
     * @throws SQLException
     */
    public static Long add(String sql, Object... vals) throws SQLException {
        Connection conn = DruidUtils.getConnection();
        QueryRunner qr = new QueryRunner();
        Long id = qr.insert(conn, sql, new ScalarHandler<Long>(), vals);
        DbUtils.closeQuietly(conn);
        return id;
    }


    public static Integer update(String sql, Object... vals) throws SQLException {
        Connection conn = DruidUtils.getConnection();
        QueryRunner qr = new QueryRunner();
        int num = qr.update(conn, sql, vals);
        DbUtils.closeQuietly(conn);
        return num;
    }

    /**
     * 返回一个对象，也可以根据不同rsh来控制返回值，进行强制转换
     *
     * @param sql
     * @param rsh
     * @param vals
     * @return
     * @throws SQLException
     */
    public static <T> T selectOne(String sql, ResultSetHandler<T> rsh, Object... vals) throws SQLException {
        Connection conn = DruidUtils.getConnection();
        QueryRunner qr = new QueryRunner();
        T res = qr.query(conn, sql, rsh, vals);
        DbUtils.closeQuietly(conn);
        return res;
    }

    /**
     * 返回list，分页
     *
     * @param sql
     * @param rsh
     * @param vals
     * @return
     * @throws SQLException
     */
    public static <T> List<T> select(String sql, BeanListHandler<T> rsh, Object... vals) throws SQLException {
        Connection conn = DruidUtils.getConnection();
        QueryRunner qr = new QueryRunner();
        List res = qr.query(conn, sql, rsh, vals);
        DbUtils.closeQuietly(conn);
        return res;
    }

    /**
     * 删除
     *
     * @param sql
     * @param vals
     * @return
     * @throws SQLException
     */
    public static Integer delete(String sql, Object... vals) throws SQLException {
        Connection conn = DruidUtils.getConnection();
        QueryRunner qr = new QueryRunner();
        Integer res = qr.update(conn, sql, vals);
        DbUtils.closeQuietly(conn);
        return res;
    }

    public static long count(String sql, Object... vals) throws SQLException {
        Connection conn = DruidUtils.getConnection();
        QueryRunner qr = new QueryRunner();
        Long num = qr.query(conn, sql, new ScalarHandler<Long>(), vals);
        DbUtils.closeQuietly(conn);
        return num;
    }

    public static boolean exist(String sql, Object... vals) throws SQLException {
        Connection conn = DruidUtils.getConnection();
        QueryRunner qr = new QueryRunner();
        Boolean ok = qr.query(conn, sql, new ScalarHandler<Boolean>(), vals);
        DbUtils.closeQuietly(conn);
        return ok;
    }


}
