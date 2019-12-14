package com.hyp.blog.web.blog;

import com.hyp.blog.pojo.Classify;
import com.hyp.blog.pojo.User;
import com.hyp.blog.service.ClassifyService;
import com.hyp.blog.service.impl.ClassifyServiceImpl;
import com.hyp.blog.utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "PreAddBlogServlet",
        urlPatterns = "/blog/add/pre")
public class PreAddBlogServlet extends HttpServlet {

    private static final long serialVersionUID = -953461644874540782L;

    private ClassifyService classifyService = new ClassifyServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        list(request, response);
    }

    public void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtils.getAccount(request);
        List<Classify> res = null;
        try {
            res = classifyService.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("list", res);
        request.getRequestDispatcher("/admin/addBlog.jsp").forward(request,
                response);
    }

}
