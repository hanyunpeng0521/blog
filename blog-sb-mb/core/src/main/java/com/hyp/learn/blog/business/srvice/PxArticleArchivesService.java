package com.hyp.learn.blog.business.srvice;

import java.util.List;
import java.util.Map;

/**
 * 归档目录
 */
public interface PxArticleArchivesService {

    /**
     * 获取归档目录列表
     *
     * @return
     */
    Map<String, List> listArchives();
}
