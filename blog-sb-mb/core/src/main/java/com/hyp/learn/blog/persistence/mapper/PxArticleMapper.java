package com.hyp.learn.blog.persistence.mapper;


import com.hyp.learn.blog.business.vo.ArticleConditionVO;
import com.hyp.learn.blog.persistence.beans.PxArticle;
import com.hyp.learn.blog.plugin.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface PxArticleMapper extends BaseMapper<PxArticle> {

    /**
     * 分页查询，关联查询文章标签、文章类型
     *
     * @param vo
     * @return
     */
    List<PxArticle> findPageBreakByCondition(ArticleConditionVO vo);

    /**
     * 统计指定文章的标签集合
     *
     * @param list
     * @return
     */
    List<PxArticle> listTagsByArticleId(List<Long> list);

    /**
     * 获取文章详情，关联查询文章标签、文章类型
     *
     * @param id
     * @return
     */
    PxArticle get(Long id);

    /**
     * 获取上一篇和下一篇(是否可以通过get时查出来？ BizArticle中关联两个BizArticle：prev & next)
     *
     * @param insertTime
     * @return
     */
    List<PxArticle> getPrevAndNextArticles(Date insertTime);

    /**
     * 获取热门文章
     *
     * @return
     */
    List<PxArticle> listHotArticle();

    /**
     * 是否存在文章
     *
     * @param id
     * @return
     */
    Integer isExist(Long id);

    /**
     * 批量修改status
     *
     * @param list
     * @param status
     * @return
     */
    int batchUpdateStatus(@Param("list") List<Long> list, @Param("status") boolean status);

}
