package com.hyp.learn.blog.business.srvice.impl;

import com.hyp.learn.blog.business.entity.ArticleLook;
import com.hyp.learn.blog.business.srvice.PxArticleLookService;
import com.hyp.learn.blog.persistence.mapper.PxArticleLookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.Date;

/**
 * 文章浏览记录
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.business.srvice.impl
 * hyp create at 20-3-22
 **/
@Service
public class PxArticleLookServiceImpl implements PxArticleLookService {

    @Autowired
    private PxArticleLookMapper pxArticleLookMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ArticleLook insert(ArticleLook entity) {
        Assert.notNull(entity, "ArticleLook不可为空！");
        entity.setUpdateTime(new Date());
        entity.setCreateTime(new Date());
        pxArticleLookMapper.insertSelective(entity.getPxArticleLook());
        return entity;
    }
}
