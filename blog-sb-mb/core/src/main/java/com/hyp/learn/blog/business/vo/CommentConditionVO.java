package com.hyp.learn.blog.business.vo;


import com.hyp.learn.blog.framework.object.BaseConditionVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CommentConditionVO extends BaseConditionVO {
    private Long userId;
    private Long sid;
    private Long pid;
    private String qq;
    private String email;
    private String url;
    private String status;
}

