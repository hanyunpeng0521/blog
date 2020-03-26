package com.hyp.learn.blog.framework.property;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.time.Duration;

/**
 * redis属性配置文件
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.property
 * hyp create at 20-3-18
 **/
@Component
@ConfigurationProperties(prefix = "spring.redis")
@Data
@EqualsAndHashCode(callSuper = false)
@Order(-1)
public class RedisProperties {
    private Integer database = 0;
    private String host = "127.0.0.1";
    private Integer port = 6379;
    private String password = "";
    /**
     * 默认30天 = 2592000s
     */
    private Integer expire = 2592000;
    private Duration timeout = Duration.ofSeconds(this.expire);

}
