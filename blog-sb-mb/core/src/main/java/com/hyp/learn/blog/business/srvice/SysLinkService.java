package com.hyp.learn.blog.business.srvice;


import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.entity.Link;
import com.hyp.learn.blog.business.vo.LinkConditionVO;
import com.hyp.learn.blog.framework.exception.PxFileException;
import com.hyp.learn.blog.framework.object.AbstractService;

import java.util.List;
import java.util.Map;

/**
 * 友情链接
 */
public interface SysLinkService extends AbstractService<Link, Long> {

    Link getOneByUrl(String url);

    PageInfo<Link> findPageBreakByCondition(LinkConditionVO vo);

    /**
     * 查询可在首页显示的友情链接列表
     *
     * @return
     */
    List<Link> listOfIndex();

    /**
     * 查询可在内页显示的友情链接列表
     *
     * @return
     */
    List<Link> listOfInside();

    /**
     * 查询已禁用的友情链接列表
     *
     * @return
     */
    List<Link> listOfDisable();

    /**
     * 分组获取所有连接
     * {index:首页显示,inside:内页,disable:禁用}
     *
     * @return
     */
    Map<String, List<Link>> listAllByGroup();

    /**
     * 自动添加友链
     *
     * @param link
     * @return
     */
    boolean autoLink(Link link) throws PxFileException;
}
