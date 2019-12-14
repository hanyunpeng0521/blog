package com.hyp.blog.web.category;

import com.hyp.blog.pojo.Classify;
import com.hyp.blog.pojo.User;
import com.hyp.blog.service.ClassifyService;
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
import java.util.Objects;

@WebServlet(name = "CategoryServlet",
        urlPatterns = "/category")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 4954984833384257415L;

    private ClassifyService classifyService = new ClassifyServiceImpl();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = SessionUtils.getAccount(request);

        // 解决从JSP页面接受中文参数乱码
        request.setCharacterEncoding("UTF-8");
        String method = request.getParameter("method");

        if (method.equals("add")) {
            add(request, response);
        } else if (method.equals("delete")) {
            delete(request, response);
        } else if (method.equals("list")) {
            list(request, response);
        } else if (method.equals("edit")) {
            preEdit(request, response);
        } else if (method.equals("update")) {
            update(request, response);
        } else {
            list(request, response);
        }

    }

    public void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = SessionUtils.getAccount(request);

        List<Classify> classifies = null;
        try {
            classifies = classifyService.findByUId(user.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }


        request.setAttribute("list", classifies);
        request.getRequestDispatcher("/admin/adminCategoryList.jsp").forward(
                request, response);

    }

    public void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = SessionUtils.getAccount(request);
        Long id = ConvertHelper.strToLong(request.getParameter("id"));
        if (id > 0) {
            try {
                Classify classify = classifyService.findById(id);
                if (Objects.nonNull(classify) && user.getId() == classify.getUserId()) {
                    classifyService.delete(id);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        request.getRequestDispatcher("/servlet/CategoryServlet?method=list")
                .forward(request, response);
    }

    public void preEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = SessionUtils.getAccount(request);
        Long id = ConvertHelper.strToLong(request.getParameter("id"));
        Classify classify = null;

        if (id > 0) {
            try {
                classify = classifyService.findById(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        if (Objects.nonNull(classify) && user.getId() == classify.getUserId()) {
            request.setAttribute("category", classify);
        } else {
            request.setAttribute("category", new Classify());
        }
        request.getRequestDispatcher("/admin/editCategory.jsp").forward(
                request, response);
    }

    public void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = SessionUtils.getAccount(request);
        Long id = ConvertHelper.strToLong(request.getParameter("id"));

        String name = request.getParameter("name");
        int level = ConvertHelper.strToInt(request.getParameter("level"));

        Classify classify = null;

        if (id > 0) {
            try {
                classify = classifyService.findById(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (Objects.nonNull(classify) && user.getId() == classify.getUserId()) {
                classify.setName(name);
                classify.setLevel(level);
                try {
                    classifyService.update(classify);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        }
        request.getRequestDispatcher("category?method=list")
                .forward(request, response);
    }

    public void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 接受JSP页面传递过来的，与博文有关的3个参数：主题、内容和所属分类的编号
        User user = SessionUtils.getAccount(request);

        String name = request.getParameter("name");
        int level = ConvertHelper.strToInt(request.getParameter("level"));
        Long result = 0L;
        String message = "";
        try {
            Classify classify = classifyService.findByUIdAndName(user.getId(), name);
            if (Objects.isNull(classify)) {
                classify = new Classify(user.getId(), name, level);
                try {
                    result = classifyService.save(classify);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (result > 0) {
            message = "好消息，博客分类添加成功！";
        } else {
            message = "坏消息，博客分类添加失败！";
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("/admin/result.jsp").forward(request,
                response);


    }

}
