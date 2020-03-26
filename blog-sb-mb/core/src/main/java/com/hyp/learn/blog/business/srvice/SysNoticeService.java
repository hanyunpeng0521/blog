package com.hyp.learn.blog.business.srvice;


import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.dto.SysNoticeDTO;
import com.hyp.learn.blog.business.entity.Notice;
import com.hyp.learn.blog.business.vo.NoticeConditionVO;
import com.hyp.learn.blog.framework.object.AbstractService;

import java.util.List;

/**
 * 系统通知
 */
public interface SysNoticeService extends AbstractService<Notice, Long> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfo<Notice> findPageBreakByCondition(NoticeConditionVO vo);

    /**
     * 获取已发布的通知列表
     *
     * @return
     */
    List<SysNoticeDTO> listRelease();
}
