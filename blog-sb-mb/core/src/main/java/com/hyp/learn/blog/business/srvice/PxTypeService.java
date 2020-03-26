package com.hyp.learn.blog.business.srvice;


import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.entity.Type;
import com.hyp.learn.blog.business.vo.TypeConditionVO;
import com.hyp.learn.blog.framework.object.AbstractService;

import java.util.List;

/**
 * 分类
 */
public interface PxTypeService extends AbstractService<Type, Long> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfo<Type> findPageBreakByCondition(TypeConditionVO vo);

    List<Type> listParent();

    List<Type> listTypeForMenu();
}
