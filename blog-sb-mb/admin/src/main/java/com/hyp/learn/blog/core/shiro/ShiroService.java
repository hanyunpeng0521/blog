package com.hyp.learn.blog.core.shiro;

import java.util.Map;

/**
 *
 */
public interface ShiroService {

    Map<String, String> loadFilterChainDefinitions();

    void updatePermission();

    void reloadAuthorizingByRoleId(Long roleId);
}
