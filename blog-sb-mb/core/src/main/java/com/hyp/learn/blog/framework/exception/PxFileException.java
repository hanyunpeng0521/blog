package com.hyp.learn.blog.framework.exception;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.exception
 * hyp create at 20-3-18
 **/
public class PxFileException extends RuntimeException {
    public PxFileException() {
    }

    public PxFileException(String message) {
        super(message);
    }

    public PxFileException(String message, Throwable cause) {
        super(message, cause);
    }

    public PxFileException(Throwable cause) {
        super(cause);
    }

    public PxFileException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
