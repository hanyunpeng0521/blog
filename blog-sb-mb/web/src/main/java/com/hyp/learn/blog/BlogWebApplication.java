package com.hyp.learn.blog;


import com.github.hanyunpeng0521.floordrain.annotaion.EnableFloorDrainConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 程序启动类
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog
 * hyp create at 20-3-23
 **/
@SpringBootApplication
@ServletComponentScan
@EnableTransactionManagement
@EnableFloorDrainConfiguration
public class BlogWebApplication {
    public static void main(String[] args) {
        SpringApplication.run(BlogWebApplication.class, args);
    }
}
