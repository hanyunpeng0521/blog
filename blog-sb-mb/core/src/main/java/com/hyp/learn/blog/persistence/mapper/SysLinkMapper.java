package com.hyp.learn.blog.persistence.mapper;

import com.hyp.learn.blog.business.vo.LinkConditionVO;
import com.hyp.learn.blog.persistence.beans.SysLink;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysLinkMapper extends BaseMapper<SysLink> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<SysLink> findPageBreakByCondition(LinkConditionVO vo);
}
