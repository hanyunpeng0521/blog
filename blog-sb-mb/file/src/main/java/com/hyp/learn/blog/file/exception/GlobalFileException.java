package com.hyp.learn.blog.file.exception;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.file.exception
 * hyp create at 20-3-17
 **/
public class GlobalFileException extends RuntimeException {
    public GlobalFileException() {
        super();
    }

    public GlobalFileException(String message) {
        super(message);
    }

    public GlobalFileException(String message, Throwable cause) {
        super(message, cause);
    }

    public GlobalFileException(Throwable cause) {
        super(cause);
    }

    protected GlobalFileException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}