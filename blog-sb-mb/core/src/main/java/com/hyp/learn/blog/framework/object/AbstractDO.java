package com.hyp.learn.blog.framework.object;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;

/**
 * 数据类基类
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.object
 * hyp create at 20-3-18
 **/
@Data
@EqualsAndHashCode(callSuper = false)
public abstract class AbstractDO implements Serializable {
    /**
     * @fieldName: serialVersionUID
     * @fieldType: long
     */
    private static final long serialVersionUID = 5088697004564546450L;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;

}
