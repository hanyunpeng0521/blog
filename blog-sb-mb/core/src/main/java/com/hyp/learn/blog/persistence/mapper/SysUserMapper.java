package com.hyp.learn.blog.persistence.mapper;

import com.hyp.learn.blog.business.vo.UserConditionVO;
import com.hyp.learn.blog.persistence.beans.SysUser;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysUserMapper extends BaseMapper<SysUser> {

    List<SysUser> findPageBreakByCondition(UserConditionVO vo);

    List<SysUser> listByRoleId(Long roleId);

}
