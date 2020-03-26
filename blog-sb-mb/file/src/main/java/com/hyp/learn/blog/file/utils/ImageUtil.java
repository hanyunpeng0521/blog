package com.hyp.learn.blog.file.utils;

import com.hyp.learn.blog.file.entity.VFile;
import com.hyp.learn.blog.file.exception.GlobalFileException;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.*;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

/**
 * 操作图片工具类
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.file.utils
 * hyp create at 20-3-17
 **/
public class ImageUtil {
    /**
     * 获取图片信息
     *
     * @param file
     * @throws IOException
     */
    public static VFile getInfo(File file) {
        if (null == file) {
            return new VFile();
        }
        try {
            return getInfo(new FileInputStream(file))
                    .setSize(file.length())
                    .setOriginalFileName(file.getName())
                    .setSuffix(FileUtil.getSuffix(file.getName()));
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalFileException("获取图片信息发生异常！", e);
        }
    }

    /**
     * 获取图片信息
     *
     * @param multipartFile
     * @throws IOException
     */
    public static VFile getInfo(MultipartFile multipartFile) {
        if (null == multipartFile) {
            return new VFile();
        }
        try {
            return getInfo(multipartFile.getInputStream())
                    .setSize(multipartFile.getSize())
                    .setOriginalFileName(multipartFile.getOriginalFilename())
                    .setSuffix(FileUtil.getSuffix(multipartFile.getOriginalFilename()));
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalFileException("获取图片信息发生异常！", e);
        }
    }

    /**
     * 获取图片信息
     *
     * @param inputStream
     * @throws IOException
     */
    public static VFile getInfo(InputStream inputStream) {
        try (BufferedInputStream in = new BufferedInputStream(inputStream)) {
            //字节流转图片对象
            Image bi = ImageIO.read(in);
            if (null == bi) {
                return new VFile();
            }
            //获取默认图像的高度，宽度
            return new VFile()
                    .setWidth(bi.getWidth(null))
                    .setHeight(bi.getHeight(null))
                    .setSize(inputStream.available());
        } catch (Exception e) {
            throw new GlobalFileException("获取图片信息发生异常！", e);
        }
    }
}
