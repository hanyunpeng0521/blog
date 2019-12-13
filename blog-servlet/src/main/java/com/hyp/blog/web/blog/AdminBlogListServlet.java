package com.hyp.blog.web.blog;

import com.hyp.blog.commons.Page;
import com.hyp.blog.pojo.User;
import com.hyp.blog.service.ArticleService;
import com.hyp.blog.service.impl.ArticleServiceImpl;
import com.hyp.blog.utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminBlogListServlet",
        urlPatterns = "/blog/list")
public class AdminBlogListServlet extends HttpServlet {
    private static final long serialVersionUID = -7152478870507997462L;
    private ArticleService articleService = new ArticleServiceImpl();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtils.getAccount(request);

        int page = Integer.parseInt(request.getParameter("page"));
        int size = Integer.parseInt(request.getParameter("size"));
        Page articles = new Page();
        try {
            articles = articleService.findByUId(user.getId(), page, size);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("list", articles);
        request.getRequestDispatcher("/admin/adminBlogList.jsp").forward(request, response);
    }

}
