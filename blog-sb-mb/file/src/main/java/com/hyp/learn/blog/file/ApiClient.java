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
public interface ApiClient {

    VFile uploadImg(MultipartFile file);

    VFile uploadImg(File file);

    VFile uploadImg(InputStream is, String key);

    boolean removeFile(String key);
}
