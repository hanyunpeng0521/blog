package com.hyp.learn.blog.persistence.mapper;


import com.hyp.learn.blog.business.vo.ArticleTagsConditionVO;
import com.hyp.learn.blog.persistence.beans.PxArticleTags;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PxArticleTagsMapper extends BaseMapper<PxArticleTags> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<PxArticleTags> findPageBreakByCondition(ArticleTagsConditionVO vo);
}
