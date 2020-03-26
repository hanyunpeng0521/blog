package com.hyp.learn.blog.persistence.mapper;


import com.hyp.learn.blog.business.vo.FileConditionVO;
import com.hyp.learn.blog.persistence.beans.PxFile;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PxFileMapper extends BaseMapper<PxFile> {

    List<PxFile> findPageBreakByCondition(FileConditionVO vo);
}
