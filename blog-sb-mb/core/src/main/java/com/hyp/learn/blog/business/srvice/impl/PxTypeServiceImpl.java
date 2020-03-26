package com.hyp.learn.blog.business.srvice.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.entity.Type;
import com.hyp.learn.blog.business.srvice.PxTypeService;
import com.hyp.learn.blog.business.vo.TypeConditionVO;
import com.hyp.learn.blog.framework.exception.PxException;
import com.hyp.learn.blog.persistence.beans.PxArticle;
import com.hyp.learn.blog.persistence.beans.PxType;
import com.hyp.learn.blog.persistence.mapper.PxArticleMapper;
import com.hyp.learn.blog.persistence.mapper.PxTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 分类
 */
@Service
public class PxTypeServiceImpl implements PxTypeService {

    @Autowired
    private PxTypeMapper pxTypeMapper;
    @Autowired
    private PxArticleMapper pxArticleMapper;

    @Override
    public PageInfo<Type> findPageBreakByCondition(TypeConditionVO vo) {
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<PxType> list = pxTypeMapper.findPageBreakByCondition(vo);
        List<Type> boList = getTypes(list);
        if (boList == null) return null;
        PageInfo bean = new PageInfo<PxType>(list);
        bean.setList(boList);
        return bean;
    }

    @Override
    public List<Type> listParent() {
        List<PxType> list = pxTypeMapper.listParent();
        return getTypes(list);
    }

    @Override
    public List<Type> listTypeForMenu() {
        TypeConditionVO vo = new TypeConditionVO();
        vo.setPageNumber(1);
        vo.setPageSize(100);
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<PxType> entityList = pxTypeMapper.listTypeForMenu();
        return getTypes(entityList);
    }

    private List<Type> getTypes(List<PxType> list) {
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<Type> boList = new ArrayList<>();
        for (PxType pxType : list) {
            boList.add(new Type(pxType));
        }
        return boList;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Type insert(Type entity) {
        Assert.notNull(entity, "Type不可为空！");
        entity.setUpdateTime(new Date());
        entity.setCreateTime(new Date());
        pxTypeMapper.insertSelective(entity.getPxType());
        return entity;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean removeByPrimaryKey(Long primaryKey) {

        PxArticle article = new PxArticle();
        article.setTypeId(primaryKey);
        List<PxArticle> articles = pxArticleMapper.select(article);
        if (!CollectionUtils.isEmpty(articles)) {
            throw new PxException("当前分类下存在文章信息，禁止删除！");
        }
        return pxTypeMapper.deleteByPrimaryKey(primaryKey) > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateSelective(Type entity) {
        Assert.notNull(entity, "Type不可为空！");
        entity.setUpdateTime(new Date());
        return pxTypeMapper.updateByPrimaryKey(entity.getPxType()) > 0;
    }

    @Override
    public Type getByPrimaryKey(Long primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        PxType entity = pxTypeMapper.selectByPrimaryKey(primaryKey);
        return null == entity ? null : new Type(entity);
    }

    @Override
    public List<Type> listAll() {
        TypeConditionVO vo = new TypeConditionVO();
        vo.setPageNumber(1);
        vo.setPageSize(100);
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<PxType> entityList = pxTypeMapper.selectAll();

        List<Type> list = getTypes(entityList);
        if (list == null) return null;
        return list;
    }
}
