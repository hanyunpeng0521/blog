package com.hyp.learn.blog.runner;

import com.hyp.learn.blog.core.schedule.ArticleLookTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

/**
 * 执行保存文章浏览记录任务
 */
@Component
public class TaskRunner implements ApplicationRunner {

    @Autowired
    private ArticleLookTask articleLookTask;

    @Override
    public void run(ApplicationArguments args) {
        articleLookTask.save();
    }
}
