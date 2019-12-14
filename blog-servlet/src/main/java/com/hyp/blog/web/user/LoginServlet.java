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
 * 免登陆：https://img-blog.csdn.net/20180902013308695?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L21vc2hlbmdyZW5oZXJl/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70
 * <p>
 * 登录界面将表单数据提交给LoginServlet处理，并把获取的数据保存到Cookie对象中去。
 *
 * @author hyp
 * Project name is blog
 * Include in ${PACKAGE_NAME}
 * hyp create at 19-12-12
 **/
@WebServlet(name = "LoginServlet",
        urlPatterns = "/user/login")
public class LoginServlet extends HttpServlet {

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
                user = userService.login(login);
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
                        + DESUtil.getEncryptString(password));
                cookie.setMaxAge(Integer.parseInt(autoLogin));
                cookie.setPath(request.getContextPath());
                response.addCookie(cookie);
            }
            //6.跳转至首页
            response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
        } else {
            request.setAttribute("errerMsg", "用户名或密码错");
            request.getRequestDispatcher("/admin/login.jsp")
                    .forward(request, response);
        }
    }
}
