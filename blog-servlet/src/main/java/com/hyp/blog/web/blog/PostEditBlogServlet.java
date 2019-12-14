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
import java.util.Objects;

@WebServlet(name = "PostEditBlogServlet",
        urlPatterns = "/blog/edit/post")
public class PostEditBlogServlet extends HttpServlet {
    private static final long serialVersionUID = -136961912199637006L;
    private ArticleService articleService = new ArticleServiceImpl();
    private ClassifyService classifyService = new ClassifyServiceImpl();

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = SessionUtils.getAccount(request);

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Long id = ConvertHelper.strToLong(request.getParameter("id"));
        Long categoryId = ConvertHelper.strToLong(request.getParameter("category"));

        Classify classify = null;

        int result = 0;
        String message = "";

        if (categoryId > 0) {
            try {
                classify = classifyService.findById(categoryId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (id > 0 && Objects.nonNull(classify)) {
                Article article = null;
                try {
                    article = articleService.findById(id);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (Objects.nonNull(article)) {
                    article.setTitle(title);
                    article.setClzId(classify.getId());
                    article.setClzName(classify.getName());
                    article.setContext(content);
                    try {
                        result = articleService.update(article);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }


        if (result == 1) {
            message = "您修改成功了！";
        } else {
            message = "您修改失败了！";
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("/admin/result.jsp").forward(request,
                response);

    }
}
