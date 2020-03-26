package com.hyp.learn.blog.framework.exception;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.exception
 * hyp create at 20-3-18
 **/
public class PxArticleException extends RuntimeException {
    public PxArticleException() {
    }

    public PxArticleException(String message) {
        super(message);
    }

    public PxArticleException(String message, Throwable cause) {
        super(message, cause);
    }

    public PxArticleException(Throwable cause) {
        super(cause);
    }

    public PxArticleException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
