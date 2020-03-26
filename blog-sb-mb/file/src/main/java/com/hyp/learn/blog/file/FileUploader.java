package com.hyp.learn.blog.file;

import com.hyp.learn.blog.file.entity.VFile;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.InputStream;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.file
 * hyp create at 20-3-17
 **/
public interface FileUploader {

    /**
     * 上传文件
     *
     * @param file       待上传的文件流
     * @param uploadType 文件上传类型，用来区分文件
     * @param suffix     文件后缀
     * @param save       是否保存
     */
    VFile upload(InputStream file, String uploadType, String suffix, boolean save);

    /**
     * 上传文件
     *
     * @param file       待上传的文件
     * @param uploadType 文件上传类型，用来区分文件
     * @param save       是否保存
     */
    VFile upload(File file, String uploadType, boolean save);

    /**
     * 上传文件
     *
     * @param file       待上传的文件
     * @param uploadType 文件上传类型，用来区分文件
     * @param save       是否保存
     */
    VFile upload(MultipartFile file, String uploadType, boolean save);

    /**
     * 删除文件
     *
     * @param filePath   文件路径
     * @param uploadType 文件类型
     */
    boolean delete(String filePath, String uploadType);
}
