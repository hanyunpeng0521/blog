package com.hyp.blog.web.blog;

import com.hyp.blog.pojo.Article;
import com.hyp.blog.pojo.Comment;
import com.hyp.blog.service.ArticleService;
import com.hyp.blog.service.CommentService;
import com.hyp.blog.service.impl.ArticleServiceImpl;
import com.hyp.blog.service.impl.CommentServiceImpl;
import com.hyp.blog.utils.ConvertHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetBlogServlet",
        urlPatterns = "/blog/get")
public class GetBlogServlet extends HttpServlet {
    private static final long serialVersionUID = -7152478870507997462L;
    private ArticleService articleService = new ArticleServiceImpl();
    private CommentService commentService = new CommentServiceImpl();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = ConvertHelper.strToLong(request.getParameter("id"));
        Article article = null;
        List<Comment> comments = null;
        if (id > 0) {
            try {
                article = articleService.findById(id);
                //根据博文的id，读取这个博文下的所有评论
                comments = commentService.findByAId(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("blog", article);
        request.setAttribute("commentList", comments);
        request.getRequestDispatcher("/displayBlog.jsp").forward(request,
                response);
    }
}
