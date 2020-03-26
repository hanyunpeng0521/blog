package com.hyp.learn.blog.business.srvice;


import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.entity.Log;
import com.hyp.learn.blog.business.enums.PlatformEnum;
import com.hyp.learn.blog.business.vo.LogConditionVO;
import com.hyp.learn.blog.framework.object.AbstractService;

public interface SysLogService extends AbstractService<Log, Integer> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfo<Log> findPageBreakByCondition(LogConditionVO vo);

    void asyncSaveSystemLog(PlatformEnum platform, String bussinessName);
}
