package com.hyp.blog.filter;

import com.hyp.blog.pojo.User;
import com.hyp.blog.service.UserService;
import com.hyp.blog.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.hyp.blog.utils.SessionUtils.getAccount;

/**
 * https://blog.csdn.net/a754895/article/details/82632747
 * 运用AOP的思想，让我们的系统变得可配置。
 * 增强了系统的可维护性和代码重用性，让业务逻辑更加清晰，
 * 将公共的部分（日志、权限、事务、工作流等）分离出来。
 * <p>
 * <p>
 * 登录成功保存登录时Cookie以及Session，
 * 下次打开网站通过过滤器拦截查看Session是否存在用户（考虑用户没有关闭浏览器的情况），
 * 如果Session中有用户数据，放行，从Cookie中查找用户数据如果没有数据，放行。
 *
 * @author hyp
 * Project name is blog
 * Include in ${PACKAGE_NAME}
 * hyp create at 19-12-12
 **/
@WebFilter(
        filterName = "AuthFilter",
        urlPatterns = {"/*"}
)
public class AuthFilter implements Filter {


    private UserService userService;

    @Override
    public void destroy() {
        userService = null;
    }


    /**
     * 判断session中是否有用户的信息:
     * * session中如果有:放行.
     * * session中没有:
     * * 从Cookie中获取:
     * * Cookie中没有:放行.
     * * Cookie中有:
     * * 获取Cookie中存的用户名和密码到数据库查询.
     * * 没有查询到:跳转到登录.
     * * 查询到:将用户信息存入到session . 放行.
     */
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        //从session里取的用户信息

        User user = getAccount(request);

        if (user != null) {
            // 有用户信息,放行
            chain.doFilter(req, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/blog/admin/login.jsp");
        }
    }

    @Override
    public void init(FilterConfig config) throws ServletException {
        userService = new UserServiceImpl();
    }


}
