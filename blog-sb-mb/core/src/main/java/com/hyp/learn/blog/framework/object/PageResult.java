package com.hyp.learn.blog.framework.object;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * bootstrap table用到的返回json格式
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.object
 * hyp create at 20-3-18
 **/
@Data
@EqualsAndHashCode(callSuper = false)
public class PageResult {
    //总数
    private Long total;
    //数据
    private List rows;

    public PageResult(Long total, List rows) {
        this.total = total;
        this.rows = rows;
    }

    public PageResult() {
    }
}
