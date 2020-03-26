package com.hyp.learn.blog.framework.exception;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.exception
 * hyp create at 20-3-18
 **/
public class PxException extends RuntimeException {
    public PxException() {
    }

    public PxException(String message) {
        super(message);
    }

    public PxException(String message, Throwable cause) {
        super(message, cause);
    }

    public PxException(Throwable cause) {
        super(cause);
    }

    public PxException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
