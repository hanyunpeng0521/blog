package com.hyp.learn.blog.business.srvice.impl;

import com.hyp.learn.blog.business.entity.User;
import com.hyp.learn.blog.business.enums.UserTypeEnum;
import com.hyp.learn.blog.business.srvice.AuthService;
import com.hyp.learn.blog.business.srvice.SysUserService;
import com.hyp.learn.blog.plugin.oauth.RequestFactory;
import com.hyp.learn.blog.utils.BeanConvertUtil;
import com.hyp.learn.blog.utils.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthResponse;
import me.zhyd.oauth.model.AuthUser;
import me.zhyd.oauth.request.AuthRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 认证授权服务
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.business.srvice.impl
 * hyp create at 20-3-22
 **/
@Slf4j
@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private SysUserService userService;

    @Override
    public boolean login(String source, AuthCallback callback) {
        AuthRequest authRequest = RequestFactory.getInstance(source).getRequest();
        AuthResponse response = authRequest.login(callback);
        if (response.ok()) {
            AuthUser authUser = (AuthUser) response.getData();
            User newUser = BeanConvertUtil.doConvert(authUser, User.class);
            newUser.setSource(authUser.getSource().toString());
            if (null != authUser.getGender()) {
                newUser.setGender(authUser.getGender().getCode());
            }
            User user = userService.getByUuidAndSource(authUser.getUuid(), authUser.getSource().toString());
            newUser.setUserType(UserTypeEnum.USER);
            if (null != user) {
                newUser.setId(user.getId());
                userService.updateSelective(newUser);
            } else {
                userService.insert(newUser);
            }
            SessionUtil.setUser(newUser);
            return true;
        }
        log.warn("[{}] {}", source, response.getMsg());
        return false;
    }

    @Override
    public boolean revoke(String source, Long userId) {
        return false;
    }

    @Override
    public void logout() {
        SessionUtil.removeUser();
    }
}
