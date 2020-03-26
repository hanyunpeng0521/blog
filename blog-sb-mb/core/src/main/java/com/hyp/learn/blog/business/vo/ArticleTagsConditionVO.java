package com.hyp.learn.blog.business.vo;


import com.hyp.learn.blog.framework.object.BaseConditionVO;
import com.hyp.learn.blog.framework.tag.ArticleTags;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = false)
public class ArticleTagsConditionVO extends BaseConditionVO {
    private ArticleTags articleTags;
}

