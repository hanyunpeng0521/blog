package com.hyp.learn.blog.framework.config;

import com.hyp.learn.blog.business.srvice.SysConfigService;
import com.hyp.learn.blog.framework.tag.ArticleTags;
import com.hyp.learn.blog.framework.tag.CustomTags;
import com.jagregory.shiro.freemarker.ShiroTags;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * freemarker配置类
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.config
 * hyp create at 20-3-18
 **/
@Configuration
public class FreeMarkerConfig {

    @Autowired
    protected freemarker.template.Configuration configuration;
    @Autowired
    protected CustomTags customTags;
    @Autowired
    protected ArticleTags articleTags;
    @Autowired
    private SysConfigService configService;

    /**
     * TODO 添加自定义标签
     */
    @PostConstruct
    public void setSharedVariable() {

        try {
            configuration.setSharedVariable("zhydTag", customTags);
            configuration.setSharedVariable("articleTag", articleTags);
            configuration.setSharedVariable("config", configService.getConfigs());
            //shiro标签
            configuration.setSharedVariable("shiro", new ShiroTags());
        } catch (TemplateModelException e) {
            e.printStackTrace();
        }
    }
}
