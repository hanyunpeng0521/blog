package com.hyp.learn.blog.vo;

import lombok.Data;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.vo
 * hyp create at 20-2-2
 **/
@Data
public class BlogQuery {
    private String title;
    private Long typeId;
    private boolean recommend;
}
