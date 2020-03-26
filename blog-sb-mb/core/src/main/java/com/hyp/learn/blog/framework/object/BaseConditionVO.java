package com.hyp.learn.blog.framework.object;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 分页查询基类
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.object
 * hyp create at 20-3-18
 **/
@Data
@EqualsAndHashCode(callSuper = false)
public class BaseConditionVO {
    //默认页面size
    public final static int DEFAULT_PAGE_SIZE = 10;
    //页号
    private int pageNumber = 1;
    //页面size
    private int pageSize = 0;
    //页面开始
    private int pageStart = 0;
    //排序字段
    private String orderField;
    //配置方向
    private String orderDirection;
    //关键字
    private String keywords;
    //开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startDate;
    //结束时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endDate;

    public int getPageSize() {
        return pageSize > 0 ? pageSize : DEFAULT_PAGE_SIZE;
    }

    public int getPageStart() {
        return pageNumber > 0 ? (pageNumber - 1) * getPageSize() : 0;
    }
}
