package com.hyp.learn.blog.file.exception;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.file.exception
 * hyp create at 20-3-17
 **/
public class LocalApiException extends GlobalFileException {
    public LocalApiException() {
        super();
    }

    public LocalApiException(String message) {
        super(message);
    }

    public LocalApiException(String message, Throwable cause) {
        super(message, cause);
    }

    public LocalApiException(Throwable cause) {
        super(cause);
    }
}
