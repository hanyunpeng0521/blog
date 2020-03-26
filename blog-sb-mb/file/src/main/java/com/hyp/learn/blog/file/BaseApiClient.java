package com.hyp.learn.blog.file;

import cn.hutool.core.date.DateUtil;
import com.hyp.learn.blog.file.entity.VFile;
import com.hyp.learn.blog.file.exception.GlobalFileException;
import com.hyp.learn.blog.file.utils.FileUtil;
import com.hyp.learn.blog.file.utils.ImageUtil;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.Date;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.file
 * hyp create at 20-3-17
 **/
public abstract class BaseApiClient implements ApiClient {
    protected static final String DEFAULT_PREFIX = "blog/";

    protected String storageType;
    protected String newFileName;
    protected String suffix;

    public BaseApiClient(String storageType) {
        this.storageType = storageType;
    }

    @Override
    public VFile uploadImg(MultipartFile file) {
        this.check();
        if (file == null) {
            throw new GlobalFileException("[" + this.storageType + "]文件上传失败：文件不可为空");
        }
        try {
            VFile res = this.uploadImg(file.getInputStream(), file.getOriginalFilename());
            VFile imageInfo = ImageUtil.getInfo(file);
            return res.setSize(imageInfo.getSize())
                    .setOriginalFileName(file.getOriginalFilename())
                    .setWidth(imageInfo.getWidth())
                    .setHeight(imageInfo.getHeight());
        } catch (IOException e) {
            throw new GlobalFileException("[" + this.storageType + "]文件上传失败：" + e.getMessage());
        }
    }

    @Override
    public VFile uploadImg(File file) {
        this.check();
        if (file == null) {
            throw new GlobalFileException("[" + this.storageType + "]文件上传失败：文件不可为空");
        }
        try {
            InputStream is = new BufferedInputStream(new FileInputStream(file));
            VFile res = this.uploadImg(is, "temp" + FileUtil.getSuffix(file));
            VFile imageInfo = ImageUtil.getInfo(file);
            return res.setSize(imageInfo.getSize())
                    .setOriginalFileName(file.getName())
                    .setWidth(imageInfo.getWidth())
                    .setHeight(imageInfo.getHeight());
        } catch (FileNotFoundException e) {
            throw new GlobalFileException("[" + this.storageType + "]文件上传失败：" + e.getMessage());
        }
    }

    void createNewFileName(String key, String pathPrefix) {
        this.suffix = FileUtil.getSuffix(key);
        if (!FileUtil.isPicture(this.suffix)) {
            throw new GlobalFileException("[" + this.storageType + "] 非法的图片文件[" + key + "]！目前只支持以下图片格式：[jpg, jpeg, png, gif, bmp]");
        }
        String fileName = DateUtil.format(new Date(), "yyyyMMddHHmmssSSS");
        this.newFileName = pathPrefix + (fileName + this.suffix);
    }

    protected abstract void check();
}
