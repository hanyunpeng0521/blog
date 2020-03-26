package com.hyp.learn.blog.framework.exception;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.exception
 * hyp create at 20-3-18
 **/
public class PxCommentException extends RuntimeException {
    public PxCommentException() {
    }

    public PxCommentException(String message) {
        super(message);
    }

    public PxCommentException(String message, Throwable cause) {
        super(message, cause);
    }

    public PxCommentException(Throwable cause) {
        super(cause);
    }

    public PxCommentException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
