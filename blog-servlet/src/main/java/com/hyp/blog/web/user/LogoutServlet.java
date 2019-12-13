package com.hyp.blog.web.user;

import com.hyp.blog.utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author hyp
 * Project name is blog
 * Include in
 * hyp create at 19-12-12
 **/
@WebServlet(name = "LogoutServlet",
        urlPatterns = "/user/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SessionUtils.removeAccount(request, response);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
