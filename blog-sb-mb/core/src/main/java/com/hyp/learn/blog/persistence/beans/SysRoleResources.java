package com.hyp.learn.blog.persistence.beans;

import com.hyp.learn.blog.framework.object.AbstractDO;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = false)
public class SysRoleResources extends AbstractDO {
    private Long roleId;
    private Long resourcesId;
}
