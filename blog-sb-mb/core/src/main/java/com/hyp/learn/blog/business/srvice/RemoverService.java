package com.hyp.learn.blog.business.srvice;


import me.zhyd.hunter.config.HunterConfig;

import java.io.PrintWriter;

public interface RemoverService {


    void run(Long typeId, HunterConfig config, PrintWriter writer);

    void stop();

    void crawlSingle(Long typeId, String[] url, boolean convertImg, PrintWriter writer);
}
