package com.hyp.learn.blog.file.exception;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.file.exception
 * hyp create at 20-3-17
 **/
public class QiniuApiException extends GlobalFileException {
    public QiniuApiException() {
        super();
    }

    public QiniuApiException(String message) {
        super(message);
    }

    public QiniuApiException(String message, Throwable cause) {
        super(message, cause);
    }

    public QiniuApiException(Throwable cause) {
        super(cause);
    }
}
