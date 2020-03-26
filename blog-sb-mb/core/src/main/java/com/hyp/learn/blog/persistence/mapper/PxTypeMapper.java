package com.hyp.learn.blog.persistence.mapper;


import com.hyp.learn.blog.business.vo.TypeConditionVO;
import com.hyp.learn.blog.persistence.beans.PxType;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PxTypeMapper extends BaseMapper<PxType> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<PxType> findPageBreakByCondition(TypeConditionVO vo);

    List<PxType> listParent();

    List<PxType> listTypeForMenu();
}
