package com.hyp.learn.blog.business.srvice;


import me.zhyd.oauth.model.AuthCallback;

public interface AuthService {

    boolean login(String source, AuthCallback callback);

    boolean revoke(String source, Long userId);

    void logout();
}
