package com.hyp.blog.web.user;

import com.hyp.blog.pojo.User;
import com.hyp.blog.service.UserService;
import com.hyp.blog.service.impl.UserServiceImpl;
import com.hyp.blog.utils.DESUtil;
import com.hyp.blog.utils.SessionUtils;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Objects;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.web
 * hyp create at 19-12-12
 **/
@WebServlet(name = "RegisterServlet",
        urlPatterns = "/user/register")
public class RegisterServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    @Override
    public void init() throws ServletException {
        super.init();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获得用户名和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = null;

        //2.验证输入用户名和密码是否正确
        if (StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password)) {
            User login = new User();
            login.setName(username);
            login.setPasswd(DESUtil.getEncryptString(password));
            try {
                user = userService.register(login);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (Objects.nonNull(user)) {
            //3.将用户状态 user 对象存入 session域
            SessionUtils.setAccount(request, user);
            //4.发送自动登录的cookie
            String autoLogin = request.getParameter(SessionUtils.AUTOLOGIN);
            if (autoLogin != null) {
                //5.注意 cookie 中的密码要加密
                Cookie cookie = new Cookie(SessionUtils.AUTOLOGIN, username + "-"
                        + password);
                cookie.setMaxAge(Integer.parseInt(autoLogin));
                cookie.setPath(request.getContextPath());
                response.addCookie(cookie);
            }
            //6.跳转至首页
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            request.setAttribute("errerMsg", "用户名或密码错");
            request.getRequestDispatcher("/login.jsp")
                    .forward(request, response);
        }

    }
}
