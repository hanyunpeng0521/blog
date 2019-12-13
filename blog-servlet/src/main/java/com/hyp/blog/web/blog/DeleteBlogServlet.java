package com.hyp.blog.web.blog;

import com.hyp.blog.pojo.User;
import com.hyp.blog.service.ArticleService;
import com.hyp.blog.service.impl.ArticleServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet(name = "DeleteBlogServlet",
        urlPatterns = "/blog/delete")
public class DeleteBlogServlet extends HttpServlet {
    private static final long serialVersionUID = 7339499832960257436L;
    private ArticleService articleService = new ArticleServiceImpl();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Long id = Long.valueOf(request.getParameter("id"));
        try {
            int i = articleService.delete(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/servlet/AdminBlogListServlet")
                .forward(request, response);
    }
}
