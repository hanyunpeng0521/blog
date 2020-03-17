package com.hyp.learn.blog.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.entity
 * hyp create at 20-2-2
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "t_tag")
@DynamicInsert
@DynamicUpdate
public class Tag extends BaseEntity {


    @Id
    @GeneratedValue
    private Long id;

    private String name;

    @ManyToMany(mappedBy = "tags")
    private List<Blog> blogs = new ArrayList<>();
}
