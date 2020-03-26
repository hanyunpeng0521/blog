package com.hyp.learn.blog.business.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 文件上传类型
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.business.enums
 * hyp create at 20-3-21
 **/
@Getter
@AllArgsConstructor
public enum FileUploadType {
    /**
     * 文件上传类型
     */
    COMMON("oneblog/"),
    QRCODE("oneblog/qrcode/"),
    SIMPLE("oneblog/article/"),
    COVER_IMAGE("oneblog/cover/");

    private String path;


}

