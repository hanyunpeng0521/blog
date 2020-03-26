package com.hyp.learn.blog.persistence.mapper;

import com.hyp.learn.blog.business.vo.LogConditionVO;
import com.hyp.learn.blog.persistence.beans.SysLog;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysLogMapper extends BaseMapper<SysLog> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<SysLog> findPageBreakByCondition(LogConditionVO vo);
}
