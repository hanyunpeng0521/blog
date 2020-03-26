package com.hyp.learn.core.util;

import com.hyp.learn.blog.utils.PasswordUtil;
import org.junit.Test;

/**
 * 密码加密测试工具类
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.util
 * hyp create at 20-3-22
 **/
public class PasswordUtilTest {
    @Test
    public void passwordTest() throws Exception {
        encryptTest("123456", "admin");
    }

    public void encryptTest(String password, String salt) throws Exception {
        String encrypt = PasswordUtil.encrypt(password, salt);
        System.out.println(encrypt);
        String decrypt = PasswordUtil.decrypt("VpavsFi6DaRqF5o3nziCgw==", "root");
        System.out.println(decrypt);
    }

}
