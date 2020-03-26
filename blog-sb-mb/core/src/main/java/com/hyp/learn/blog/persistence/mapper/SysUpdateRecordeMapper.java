package com.hyp.learn.blog.persistence.mapper;

import com.hyp.learn.blog.business.vo.UpdateRecordeConditionVO;
import com.hyp.learn.blog.persistence.beans.SysUpdateRecorde;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysUpdateRecordeMapper extends BaseMapper<SysUpdateRecorde> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<SysUpdateRecorde> findPageBreakByCondition(UpdateRecordeConditionVO vo);
}
