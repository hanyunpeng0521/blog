package com.hyp.learn.blog.core.intercepter;


import com.github.hanyunpeng0521.floordrain.FloorDrainProcessor;
import com.github.hanyunpeng0521.floordrain.FloorDrainResponse;
import com.hyp.learn.blog.utils.RequestUtil;
import com.hyp.learn.blog.utils.ResultUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.concurrent.TimeUnit;

/**
 * FloorDrain，自动识别恶意请求
 */
@Component
@Slf4j
public class FloorDrainIntercepter implements HandlerInterceptor {
    private static final int SUCCESS = 1;
    @Autowired
    private FloorDrainProcessor processor;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        FloorDrainResponse br = processor.process(request);
        if (br.getCode() == SUCCESS) {
            return true;
        }
        String errorMsg = String.format("第%s次被限制！", br.getLimitCount());
        log.warn(errorMsg);
        if (RequestUtil.isAjax(request)) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=utf-8");
            PrintWriter writer = response.getWriter();
            writer.write(ResultUtil.error(errorMsg).toJson());
            writer.flush();
            writer.close();
            return false;
        }
        request.setAttribute("errorMsg", errorMsg);
        request.setAttribute("expire", TimeUnit.MILLISECONDS.toSeconds(br.getExpire()));
        request.getRequestDispatcher("/error/403").forward(request, response);
        return false;
    }
}
