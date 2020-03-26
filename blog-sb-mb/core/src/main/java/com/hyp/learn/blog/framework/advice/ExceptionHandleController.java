package com.hyp.learn.blog.framework.advice;

import com.hyp.learn.blog.business.consts.CommonConst;
import com.hyp.learn.blog.business.enums.ResponseStatus;
import com.hyp.learn.blog.file.exception.GlobalFileException;
import com.hyp.learn.blog.framework.exception.PxException;
import com.hyp.learn.blog.framework.holder.RequestHolder;
import com.hyp.learn.blog.framework.object.ResponseVO;
import com.hyp.learn.blog.utils.RequestUtil;
import com.hyp.learn.blog.utils.ResultUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

import java.lang.reflect.UndeclaredThrowableException;

/**
 * 统一异常处理类<br>
 * 捕获程序所有异常，针对不同异常，采取不同的处理方式
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.advice
 * hyp create at 20-3-18
 **/
@Slf4j
@ControllerAdvice
public class ExceptionHandleController {

    /**
     * Shiro权限认证异常
     *
     * @param e
     * @return
     */
    @ExceptionHandler(value = {UnauthorizedException.class, AccountException.class})
    @ResponseBody
    public ResponseVO unauthorizedExceptionHandle(Throwable e) {
        e.printStackTrace(); // 打印异常栈
        return ResultUtil.error(HttpStatus.UNAUTHORIZED.value(), e.getLocalizedMessage());
    }

    /**
     * Shiro权限认证异常
     *
     * @param e
     * @return
     */
    @ExceptionHandler(value = {MaxUploadSizeExceededException.class})
    @ResponseBody
    public ResponseVO maxUploadSizeExceededExceptionHandle(Throwable e) {
        e.printStackTrace(); // 打印异常栈
        return ResultUtil.error(CommonConst.DEFAULT_ERROR_CODE, ResponseStatus.UPLOAD_FILE_ERROR.getMessage() + "文件过大！");
    }

    /**
     * MethodArgumentTypeMismatchException ： 方法参数类型异常
     *
     * @param e
     * @return
     */
    @ExceptionHandler(value = MethodArgumentTypeMismatchException.class)
    @ResponseBody
    public Object methodArgumentTypeMismatchException(Throwable e) {
        log.error("url参数异常，请检查参数类型是否匹配！", e);
        if (RequestUtil.isAjax(RequestHolder.getRequest())) {
            return ResultUtil.error(ResponseStatus.INVALID_PARAMS);
        }
        return ResultUtil.forward("/error/500");
    }

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ResponseVO handle(Throwable e) {
        if (e instanceof PxException || e instanceof GlobalFileException) {
            return ResultUtil.error(e.getMessage());
        }
        if (e instanceof UndeclaredThrowableException) {
            e = ((UndeclaredThrowableException) e).getUndeclaredThrowable();
        }
        ResponseStatus responseStatus = ResponseStatus.getResponseStatus(e.getMessage());
        if (responseStatus != null) {
            log.error(responseStatus.getMessage());
            return ResultUtil.error(responseStatus.getCode(), responseStatus.getMessage());
        }
        e.printStackTrace(); // 打印异常栈
        return ResultUtil.error(CommonConst.DEFAULT_ERROR_CODE, ResponseStatus.ERROR.getMessage());
    }
}
