package com.hyp.blog.web.comment;

import com.hyp.blog.commons.Status;
import com.hyp.blog.pojo.Comment;
import com.hyp.blog.pojo.User;
import com.hyp.blog.service.CommentService;
import com.hyp.blog.service.impl.CommentServiceImpl;
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
import java.util.Objects;

@WebServlet(name = "CommentServlet",
        urlPatterns = "/comment")
public class CommentServlet extends HttpServlet {
    private static final long serialVersionUID = -2540110714710583202L;

    private CommentService commentService = new CommentServiceImpl();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String method = request.getParameter("method");
        if (method == null) {
            method = "";
        }
        if (method.equals("add")) {
            add(request, response);
        } else {
            if (method.equals("list")) {
                list(request, response);
            } else if (method.equals("delete")) {
                delete(request, response);
            } else if (method.equals("edit")) {
                preEdit(request, response);
            } else if (method.equals("update")) {
                postEdit(request, response);
            } else {
                list(request, response);
            }

        }
    }

    public void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = SessionUtils.getAccount(request);
        Comment comment = null;

        String name = request.getParameter("name");
        String content = request.getParameter("content");
        Long blogId = ConvertHelper.strToLong(request.getParameter("blog_id"));

        if (name == null || "".equals(name)) {
            name = Status.VISITOR.getDesc();
        }

        if (Objects.nonNull(user)) {
            comment = new Comment(user.getId(), user.getName(), blogId, content);
        } else {
            comment = new Comment(Status.VISITOR.getCode(), name, blogId, content);

        }

        try {
            Long id = commentService.save(comment);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        response.sendRedirect("/blog/servlet/HomeServlet?method=get&id=" + blogId);
    }

    public void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Comment> comments = null;
        try {
            comments = commentService.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("list", comments);
        request.getRequestDispatcher("/admin/adminCommentList.jsp").forward(
                request, response);
    }

    public void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = ConvertHelper.strToLong(request.getParameter("id"));

        if (id > 0) {
            try {
                commentService.delete(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        list(request, response);
    }

    public void preEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long id = ConvertHelper.strToLong(request.getParameter("id"));
        Comment comment = null;
        if (id > 0) {
            try {
                comment = commentService.findById(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        request.setAttribute("comment", comment);
        request.getRequestDispatcher("/admin/editComment.jsp").forward(request,
                response);
    }

    public void postEdit(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        Long id = ConvertHelper.strToLong(request.getParameter("id"));


        String username = request.getParameter("name");
        String content = request.getParameter("content");

        Comment comment = null;
        if (id > 0) {
            try {
                comment = commentService.findById(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (Objects.nonNull(comment)) {
                comment.setContext(content);
                comment.setUserName(username);
                try {
                    commentService.update(comment);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }
        }

        list(request, response);
    }
}
