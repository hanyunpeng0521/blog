package com.hyp.learn.blog.business.srvice;


import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.entity.UpdateRecorde;
import com.hyp.learn.blog.business.vo.UpdateRecordeConditionVO;
import com.hyp.learn.blog.framework.object.AbstractService;

/**
 * 更新记录
 */
public interface SysUpdateRecordeService extends AbstractService<UpdateRecorde, Long> {

    PageInfo<UpdateRecorde> findPageBreakByCondition(UpdateRecordeConditionVO vo);
}
