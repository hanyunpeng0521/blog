package com.hyp.blog.web.blog;

import com.hyp.blog.pojo.Article;
import com.hyp.blog.pojo.Classify;
import com.hyp.blog.pojo.User;
import com.hyp.blog.service.ArticleService;
import com.hyp.blog.service.ClassifyService;
import com.hyp.blog.service.impl.ArticleServiceImpl;
import com.hyp.blog.service.impl.ClassifyServiceImpl;
import com.hyp.blog.utils.ConvertHelper;
import com.hyp.blog.utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "PreEditBlogServlet",
        urlPatterns = "/blog/edit/pre")
public class PreEditBlogServlet extends HttpServlet {
    private static final long serialVersionUID = 5566583919589784551L;
    private ArticleService articleService = new ArticleServiceImpl();
    private ClassifyService classifyService = new ClassifyServiceImpl();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = ConvertHelper.strToLong(request.getParameter("id"));
        Article article = null;
        List<Classify> classifies = null;
        User user = SessionUtils.getAccount(request);
        try {
            article = articleService.findById(id);
            classifies = classifyService.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("blog", article);
        request.setAttribute("categorys", classifies);
        request.getRequestDispatcher("/admin/editBlog.jsp").forward(request, response);

    }
}
