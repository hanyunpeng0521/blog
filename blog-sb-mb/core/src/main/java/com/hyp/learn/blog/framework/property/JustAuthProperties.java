package com.hyp.learn.blog.framework.property;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.zhyd.oauth.config.AuthConfig;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.framework.property
 * hyp create at 20-3-24
 **/
@Component
@ConfigurationProperties(prefix = "px.oauth")
@Data
@EqualsAndHashCode(callSuper = false)
@Order(-1)
public class JustAuthProperties {

    private AuthConfig gitee;
    private AuthConfig github;
    private AuthConfig weibo;
    private AuthConfig dingtalk;
    private AuthConfig baidu;
    private AuthConfig coding;
    private AuthConfig tencentCloud;
    private AuthConfig oschina;
    private AuthConfig alipay;
    private AuthConfig qq;
    private AuthConfig wechat;
    private AuthConfig taobao;
    private AuthConfig google;
    private AuthConfig facebook;
    private AuthConfig csdn;

    private AuthConfig douyin;
    private AuthConfig linkedin;
    private AuthConfig microsoft;
    private AuthConfig mi;
    private AuthConfig toutiao;
    private AuthConfig teambition;
    private AuthConfig renren;
    private AuthConfig pinterest;
    private AuthConfig stackoverflow;
    private AuthConfig huawei;
    private AuthConfig wechatEnterprise;
}

