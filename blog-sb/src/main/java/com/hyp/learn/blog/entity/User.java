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
@Table(name = "t_user")
@DynamicInsert
@DynamicUpdate
public class User extends BaseEntity {


    @Id
    @GeneratedValue
    private Long id;

    private String nickname;
    private String username;
    private String password;
    private String email;
    private String avatar;
    private Integer type;


    @OneToMany(mappedBy = "user")
    private List<Blog> blogs = new ArrayList<>();

}
