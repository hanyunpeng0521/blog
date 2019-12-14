package com.hyp.blog.web.blog;

import com.hyp.blog.pojo.Article;
import com.hyp.blog.pojo.Classify;
import com.hyp.blog.pojo.User;
import com.hyp.blog.service.ArticleService;
import com.hyp.blog.service.ClassifyService;
import com.hyp.blog.service.impl.ArticleServiceImpl;
import com.hyp.blog.service.impl.ClassifyServiceImpl;
import com.hyp.blog.utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddBlogServlet",
        urlPatterns = "/blog/add")
public class AddBlogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ArticleService articleService = new ArticleServiceImpl();

    private ClassifyService classifyService = new ClassifyServiceImpl();

    @Override
    public void init() throws ServletException {
        super.init();

    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = SessionUtils.getAccount(request);

        // 接受JSP页面传递过来的，与博文有关的3个参数：主题、内容和所属分类的编号
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Long categoryId = Long.valueOf(request.getParameter("category"));
        Classify classify = null;
        long result = -1;

        if (categoryId > 0) {
            try {
                classify = classifyService.findById(categoryId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            Article article = new Article(title, content, user.getId(), user.getName(), classify.getId(), classify.getName());

            try {
                result = articleService.save(article);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        String message = "";
        if (result > 0) {
            message = "添加博文成功！";
        } else {
            message = "添加博文失败！";
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("/admin/result.jsp").forward(request,
                response);
    }

}