package com.hyp.learn.blog.persistence.mapper;

import com.hyp.learn.blog.business.vo.TemplateConditionVO;
import com.hyp.learn.blog.persistence.beans.SysTemplate;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysTemplateMapper extends BaseMapper<SysTemplate> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<SysTemplate> findPageBreakByCondition(TemplateConditionVO vo);
}
