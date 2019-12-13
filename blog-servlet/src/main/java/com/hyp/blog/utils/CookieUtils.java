package com.hyp.blog.utils;

import javax.servlet.http.Cookie;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.blog.utils
 * hyp create at 19-12-12
 **/
public class CookieUtils {

    public static Cookie findCookie(Cookie[] cookies, String name) {
        if (cookies == null) {
            return null;
        } else {
            for (Cookie cookie : cookies) {
                if (name.equals(cookie.getName())) {
                    return cookie;
                }
            }
        }
        return null;
    }
}
