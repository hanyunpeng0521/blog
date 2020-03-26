package com.hyp.learn.blog.persistence.mapper;

import com.hyp.learn.blog.business.vo.NoticeConditionVO;
import com.hyp.learn.blog.persistence.beans.SysNotice;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysNoticeMapper extends BaseMapper<SysNotice> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<SysNotice> findPageBreakByCondition(NoticeConditionVO vo);
}
