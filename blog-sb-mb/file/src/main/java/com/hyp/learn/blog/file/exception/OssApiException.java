package com.hyp.learn.blog.file.exception;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.file.exception
 * hyp create at 20-3-17
 **/
public class OssApiException extends GlobalFileException {
    public OssApiException() {
        super();
    }

    public OssApiException(String message) {
        super(message);
    }

    public OssApiException(String message, Throwable cause) {
        super(message, cause);
    }

    public OssApiException(Throwable cause) {
        super(cause);
    }
}
