package com.hyp.learn.blog.persistence.mapper;

import com.hyp.learn.blog.business.vo.RoleConditionVO;
import com.hyp.learn.blog.persistence.beans.SysRole;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysRoleMapper extends BaseMapper<SysRole> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<SysRole> findPageBreakByCondition(RoleConditionVO vo);

    List<SysRole> queryRoleListWithSelected(Integer userId);

    List<SysRole> listRolesByUserId(Long userId);
}
