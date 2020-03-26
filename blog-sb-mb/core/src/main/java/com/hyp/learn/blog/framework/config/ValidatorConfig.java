package com.hyp.learn.blog.framework.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.validation.MessageCodesResolver;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 配置有效性检查
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.config
 * hyp create at 20-3-18
 **/
@Configuration
@Order(0)
public class ValidatorConfig implements WebMvcConfigurer {
    @Override
    public Validator getValidator() {
        return new LocalValidatorFactoryBean();
    }

    @Override
    public MessageCodesResolver getMessageCodesResolver() {
        return null;
    }
}
