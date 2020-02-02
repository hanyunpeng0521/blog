package com.hyp.learn.blog.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
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
@Table(name = "t_type")
@DynamicInsert
@DynamicUpdate
public class Type extends BaseEntity{

    @Id
    @GeneratedValue
    private Long id;

    @NotBlank(message = "分类名称不能为空")
    private String name;

    @OneToMany(mappedBy = "type")
    private List<Blog> blogs = new ArrayList<>();
}
