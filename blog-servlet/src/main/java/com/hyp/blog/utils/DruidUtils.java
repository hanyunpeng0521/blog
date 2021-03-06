package com.hyp.blog.utils;


import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.lang3.StringUtils;

import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.utils
 * hyp create at 19-12-9
 **/
public class DruidUtils {
    private static volatile DruidUtils INSTANCE;
    private DataSource ds = null;

    private DruidUtils() {
        Properties properties = new Properties();
        String path = DruidUtils.class.getClassLoader().getResource("/db.properties").getPath();

        String sql = DruidUtils.class.getClassLoader().getResource("blog.sql").getPath();

//        System.out.println(path);
        try {
            properties.load(new FileInputStream(path));


//            properties.load(ClassLoader.getSystemResourceAsStream("db.properties"));

        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            ds = DruidDataSourceFactory.createDataSource(properties);

            if (StringUtils.isNotBlank(sql) && sql.endsWith(".sql")) {
                QueryRunner qr = new QueryRunner(ds);
                qr.execute("RUNSCRIPT FROM '" + sql + "'");
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static DruidUtils getINSTANCE() {
        if (null == INSTANCE) {
            synchronized (DruidUtils.class) {
                if (null == INSTANCE) {
                    INSTANCE = new DruidUtils();
                }
            }
        }
        return INSTANCE;
    }

    /**
     * @return Connection
     * @throws SQLException
     * @Method: getConnection
     * @Description: 从数据源中获取数据库连接
     */
    public static Connection getConnection() throws SQLException {
        DruidUtils instance = DruidUtils.getINSTANCE();
        return instance.ds.getConnection();
    }

    public static DataSource getDataSource() {
        DruidUtils instance = DruidUtils.getINSTANCE();
        return instance.ds;
    }

}
