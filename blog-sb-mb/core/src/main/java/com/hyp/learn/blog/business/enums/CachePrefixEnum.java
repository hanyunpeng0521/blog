package com.hyp.learn.blog.business.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 缓存Key前缀
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.business.enums
 * hyp create at 20-3-21
 **/
@Getter
@AllArgsConstructor
public enum CachePrefixEnum {

    /**
     *
     */
    BIZ("px_cache_"),
    /**
     * 页面
     */
    VIEW("view_cache_"),
    /**
     * 防DDOS
     */
    DDOS("ddos_cache_"),
    /**
     *
     */
    WX("wx_api_cache_"),
    /**
     * 爬虫
     */
    SPIDER("spider_cache_"),
    ;
    private String prefix;

}
