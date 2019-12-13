package com.hyp.blog.utils;

import com.hyp.blog.pojo.User;
import com.hyp.blog.service.UserService;
import com.hyp.blog.service.impl.UserServiceImpl;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Objects;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.utils
 * hyp create at 19-12-12
 **/
public class SessionUtils {
    /**
     * 当前账号常量
     */
    public static final String ACCOUNT = "account";

    public static final String AUTOLOGIN = "autologin";

    private static UserService userService = new UserServiceImpl();


    /**
     * 判断session中是否有用户的信息:
     * * session中如果有:放行.
     * * session中没有:
     * * 从Cookie中获取:
     * * Cookie中没有:放行.
     * * Cookie中有:
     * * 获取Cookie中存的用户名和密码到数据库查询.
     * * 没有查询到:跳转到登录.
     * * 查询到:将用户信息存入到session . 放行.
     */
    public static User getAccount(HttpServletRequest req) {
        User user = null;
        HttpSession session = req.getSession();
        user = (User) session.getAttribute(ACCOUNT);
        if (user == null) {
            // Session中没有用户信息,从Cookie中获取
            Cookie[] cookies = req.getCookies();
            Cookie cookie = CookieUtils.findCookie(cookies, "autoLogin");
            // System.out.println(cookie.getValue());
            // 查看cookie中是否有用户信息
            if (cookie != null) {
                // 获取cookie中用户信息到数据库中进行查询
                // 没有查到，放行
                // 查到，将用户信息存入到session中，放行
                String autologin = cookie.getValue();
                String[] parts = autologin.split("-");
                String username = parts[0];
                String password = parts[1];

                //验证输入用户名和密码是否正确
                if (StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password)) {
                    User login = new User();
                    login.setName(username);
                    login.setPasswd(password);
                    try {
                        user = userService.login(login);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (Objects.nonNull(user)) {
                    //将用户状态 user 对象存入 session域
                    SessionUtils.setAccount(req, user);
                }
            }

        }
        return user;
    }

    public static void setAccount(HttpServletRequest req, User account) {
        HttpSession session = req.getSession();
        if (account != null) {
            session.setAttribute(ACCOUNT, account);
            //session过期时间设置，以秒为单位，即在没有活动30分钟后，session将失效
//            session.setMaxInactiveInterval(30 * 60);
        }
    }

    public static void removeAccount(HttpServletRequest req, HttpServletResponse response) {
        HttpSession session = req.getSession();
        //1.用户注销
        session.removeAttribute(ACCOUNT);
        //2.从客户端删除自动登录的cookie
        Cookie cookie = new Cookie("autologin", "msg");
        cookie.setPath(req.getContextPath());
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }
}
