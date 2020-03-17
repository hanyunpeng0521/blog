package com.hyp.learn.blog.entity;

import lombok.Data;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 实体基类，所有entity继承此父类
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.entity
 * hyp create at 20-2-2
 **/
@Data
@MappedSuperclass
@SQLDelete(sql = "update demo set deleted = 1 where id = ?")
@Where(clause = "deleted = 0")
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseEntity implements Serializable {


//    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false, updatable = false, name = "create_date",
            columnDefinition = "timestamp default current_timestamp")
    private Date createTime;
//    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false, name = "modify_date",
            columnDefinition = "timestamp default current_timestamp")
    private Date updateTime;

    @Column(nullable = false,
            columnDefinition = "tinyint(1) default 0")
    private Boolean deleted;
}
