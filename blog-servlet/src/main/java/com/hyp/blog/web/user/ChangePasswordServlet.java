package com.hyp.blog.web.user;

import com.hyp.blog.pojo.User;
import com.hyp.blog.service.UserService;
import com.hyp.blog.service.impl.UserServiceImpl;
import com.hyp.blog.utils.DESUtil;
import com.hyp.blog.utils.SessionUtils;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Objects;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.web.user
 * hyp create at 19-12-13
 **/
@WebServlet(name = "ChangePasswordServlet",
        urlPatterns = "/user/cp")
public class ChangePasswordServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user =
                SessionUtils.getAccount(request);
        if (Objects.isNull(user)) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");

            if (StringUtils.isEmpty(oldPassword) || StringUtils.isEmpty(newPassword)) {
                response.sendRedirect(request.getContextPath() + "/admin/changePassword.jsp");
            } else {
                String message = "";
                if (!oldPassword.equals(DESUtil.getDecryptString(user.getPasswd()))) {
                    message = "原密码错误";
                } else {

                    user.setPasswd(DESUtil.getEncryptString(newPassword));
                    try {
                        userService.update(user);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    message = "密码修改成功";
                }
                request.setAttribute("message", message);

                request.getRequestDispatcher("/admin/result.jsp").forward(request,
                        response);
            }

        }


    }
}
