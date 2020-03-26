package com.hyp.learn.blog.plugin.file;

import com.hyp.learn.blog.file.ApiClient;
import com.hyp.learn.blog.file.FileUploader;
import com.hyp.learn.blog.file.entity.VFile;
import com.hyp.learn.blog.file.exception.GlobalFileException;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.InputStream;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.plugin.file
 * hyp create at 20-3-22
 **/
public class GlobalFileUploader extends BaseFileUploader implements FileUploader {

    @Override
    public VFile upload(InputStream is, String uploadType, String imageUrl, boolean save) {
        ApiClient apiClient = this.getApiClient(uploadType);
        VFile virtualFile = apiClient.uploadImg(is, imageUrl);
        return this.saveFile(virtualFile, save, uploadType);
    }

    @Override
    public VFile upload(File file, String uploadType, boolean save) {
        ApiClient apiClient = this.getApiClient(uploadType);
        VFile virtualFile = apiClient.uploadImg(file);
        return this.saveFile(virtualFile, save, uploadType);
    }

    @Override
    public VFile upload(MultipartFile file, String uploadType, boolean save) {
        ApiClient apiClient = this.getApiClient(uploadType);
        VFile virtualFile = apiClient.uploadImg(file);
        return this.saveFile(virtualFile, save, uploadType);
    }

    @Override
    public boolean delete(String filePath, String uploadType) {
        if (StringUtils.isEmpty(filePath)) {
            throw new GlobalFileException("[文件服务]文件删除失败，文件为空！");
        }

        ApiClient apiClient = this.getApiClient(uploadType);
        return this.removeFile(apiClient, filePath, uploadType);
    }
}

