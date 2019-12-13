package com.hyp.blog.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 1.在HttpServletRequest 到达Servlet 之前，拦截客户的HttpServletRequest
 * <p>
 * 2.根据需要检查HttpServletRequest ，也可以修改HttpServletRequest 头和数据
 * <p>
 * 3.在HttpServletResponse 到达客户端之前，拦截HttpServletResponse
 * <p>
 * 4.根据需要检查HttpServletResponse ，可以修改HttpServletResponse 头和数据
 * <p>
 * 一个Filter 可负责拦截多个请求或响应:一个请求或响应也可被多个请求拦截。
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.filter
 * hyp create at 19-12-12
 **/
@WebFilter(
        filterName = "CharacterFilter",
        urlPatterns = {"/*"}
)
public class CharacterFilter implements Filter {
    String encoding = null;


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encoding = filterConfig.getInitParameter("encoding");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        /*
         * 判断在web.xml文件中是否配置了编码格式的信息
         * 如果为空，则设置编码格式为配置文件中的编码格式
         * 否则编码格式设置为GBK
         */

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        if (this.encoding != null && !"".equals(this.encoding)) {
            request.setCharacterEncoding(encoding);
            response.setCharacterEncoding(encoding);
            response.setContentType("text/html;charset=" + encoding);
        } else {
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=utf-8");
            response.setCharacterEncoding("utf-8");
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "x-requested-with,content-type");
        /*
         * 使用doFilter方法调用链中的下一个过滤器或目标资源（servlet或JSP页面）。
         * chain.doFilter处理过滤器的其余部分（如果有的话），最终处理请求的servlet或JSP页面。
         */
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        encoding = null;
    }
}
