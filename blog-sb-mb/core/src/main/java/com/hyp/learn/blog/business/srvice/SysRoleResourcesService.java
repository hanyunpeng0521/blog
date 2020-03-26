package com.hyp.learn.blog.business.srvice;


import com.hyp.learn.blog.business.entity.RoleResources;
import com.hyp.learn.blog.framework.object.AbstractService;

/**
 * 角色资源
 */
public interface SysRoleResourcesService extends AbstractService<RoleResources, Long> {

    /**
     * 添加角色资源
     *
     * @param roleId
     * @param resourcesId
     */
    void addRoleResources(Long roleId, String resourcesId);

    /**
     * 通过角色id批量删除
     *
     * @param roleId
     */
    void removeByRoleId(Long roleId);
}
