package com.hyp.learn.blog.business.srvice.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.annotation.RedisCache;
import com.hyp.learn.blog.business.entity.Tags;
import com.hyp.learn.blog.business.srvice.PxTagsService;
import com.hyp.learn.blog.business.vo.TagsConditionVO;
import com.hyp.learn.blog.framework.exception.PxException;
import com.hyp.learn.blog.persistence.beans.PxArticleTags;
import com.hyp.learn.blog.persistence.beans.PxTags;
import com.hyp.learn.blog.persistence.mapper.PxArticleTagsMapper;
import com.hyp.learn.blog.persistence.mapper.PxTagsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 标签
 */
@Service
public class PxTagsServiceImpl implements PxTagsService {

    @Autowired
    private PxTagsMapper pxTagsMapper;
    @Autowired
    private PxArticleTagsMapper pxArticleTagsMapper;

    @Override
    public PageInfo<Tags> findPageBreakByCondition(TagsConditionVO vo) {
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<PxTags> list = pxTagsMapper.findPageBreakByCondition(vo);
        List<Tags> boList = getTags(list);
        if (boList == null) return null;
        PageInfo bean = new PageInfo<PxTags>(list);
        bean.setList(boList);
        return bean;
    }

    @Override
    public Tags getByName(String name) {
        if (StringUtils.isEmpty(name)) {
            return null;
        }
        PxTags tags = new PxTags();
        tags.setName(name);
        tags = pxTagsMapper.selectOne(tags);
        return null == tags ? null : new Tags(tags);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public Tags insert(Tags entity) {
        Assert.notNull(entity, "Tags不可为空！");
        if (this.getByName(entity.getName()) != null) {
            throw new PxException("标签添加失败，标签已存在！[" + entity.getName() + "]");
        }
        entity.setUpdateTime(new Date());
        entity.setCreateTime(new Date());
        pxTagsMapper.insertSelective(entity.getPxTags());
        return entity;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean removeByPrimaryKey(Long primaryKey) {
        PxArticleTags articleTag = new PxArticleTags();
        articleTag.setTagId(primaryKey);
        List<PxArticleTags> articleTags = pxArticleTagsMapper.select(articleTag);
        if (!CollectionUtils.isEmpty(articleTags)) {
            throw new PxException("当前标签下存在文章信息，禁止删除！");
        }
        return pxTagsMapper.deleteByPrimaryKey(primaryKey) > 0;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean updateSelective(Tags entity) {
        Assert.notNull(entity, "Tags不可为空！");
        Tags old = this.getByName(entity.getName());
        if (old != null && !old.getId().equals(entity.getId())) {
            throw new PxException("标签修改失败，标签已存在！[" + entity.getName() + "]");
        }
        entity.setUpdateTime(new Date());
        return pxTagsMapper.updateByPrimaryKeySelective(entity.getPxTags()) > 0;
    }

    @Override
    public Tags getByPrimaryKey(Long primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        PxTags entity = pxTagsMapper.selectByPrimaryKey(primaryKey);
        return null == entity ? null : new Tags(entity);
    }

    @Override
    @RedisCache
    public List<Tags> listAll() {
        List<PxTags> entityList = pxTagsMapper.selectAll();

        return getTags(entityList);
    }

    private List<Tags> getTags(List<PxTags> entityList) {
        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<Tags> list = new ArrayList<>();
        for (PxTags entity : entityList) {
            list.add(new Tags(entity));
        }
        return list;
    }
}
