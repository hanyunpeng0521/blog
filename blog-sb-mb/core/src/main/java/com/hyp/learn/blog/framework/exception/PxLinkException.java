package com.hyp.learn.blog.framework.exception;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.exception
 * hyp create at 20-3-18
 **/
public class PxLinkException extends RuntimeException {
    public PxLinkException() {
    }

    public PxLinkException(String message) {
        super(message);
    }

    public PxLinkException(String message, Throwable cause) {
        super(message, cause);
    }

    public PxLinkException(Throwable cause) {
        super(cause);
    }

    public PxLinkException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
