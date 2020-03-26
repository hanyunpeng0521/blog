package com.hyp.learn.blog.business.vo;

import com.hyp.learn.blog.business.entity.User;
import com.hyp.learn.blog.framework.object.BaseConditionVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserConditionVO extends BaseConditionVO {
    private User user;
}
