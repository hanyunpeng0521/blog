package com.hyp.learn.blog.framework.config;

import org.springframework.stereotype.Component;
import tk.mybatis.spring.annotation.MapperScan;

/**
 * mybtis配置
 * 扫描mapper接口包
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.config
 * hyp create at 20-3-18
 **/
@Component
@MapperScan("com.hyp.learn.blog.persistence.mapper")
public class MybatisConfig {
}
