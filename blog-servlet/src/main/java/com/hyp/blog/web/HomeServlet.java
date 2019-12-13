package com.hyp.blog.web;

import com.hyp.blog.commons.Page;
import com.hyp.blog.pojo.Article;
import com.hyp.blog.pojo.Classify;
import com.hyp.blog.pojo.Comment;
import com.hyp.blog.service.ArticleService;
import com.hyp.blog.service.ClassifyService;
import com.hyp.blog.service.CommentService;
import com.hyp.blog.service.impl.ArticleServiceImpl;
import com.hyp.blog.service.impl.ClassifyServiceImpl;
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
import java.util.Objects;

@WebServlet(name = "HomeServlet",
        urlPatterns = "/home")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = -7152478870507997462L;

    private ArticleService articleService = new ArticleServiceImpl();

    private CommentService commentService = new CommentServiceImpl();

    private ClassifyService classifyService = new ClassifyServiceImpl();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String method = request.getParameter("method");
        try {


            if (method == null) {
                main(request, response);
                request.getRequestDispatcher("/main.jsp")
                        .forward(request, response);
            } else if (method.equals("get")) {
                main(request, response);
                get(request, response);
                request.getRequestDispatcher("/displayBlog.jsp").forward(request,
                        response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void get(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("id"));
        Article article = null;
        List<Comment> comments = null;
        // 根据博文的id值读取一篇博文
        try {
            article = articleService.findById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // 根据博文的id，读取这个博文下的所有评论
        if (Objects.nonNull(article)) {
            try {
                comments = commentService.findByAId(article.getId());
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        request.setAttribute("blog", article);
        request.setAttribute("commentList", comments);
    }

    public void main(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        Long cid = ConvertHelper.strToLong(request.getParameter("cid"));
        Page blogs = null;
        List<Classify> classifys = null;
        Page comments = null;

        // 查询最近博客
        if (Objects.nonNull(cid) && cid > 0) {
            blogs = articleService.findByCId(cid, 1, 5);
        } else {
            blogs = articleService.getAll(1, 5);
        }

        // 查询分类
        classifys = classifyService.getAll();

        // 查询最新的评论
        comments = commentService.getAll(1, 5);

        // 读取首页需要显示的博文
        request.setAttribute("blogs", blogs);
        // 读取首页需要显示的分类信息
        request.setAttribute("categorys", classifys);
        // 读取首页需要显示的评论
        request.setAttribute("comments", comments);
    }
}
