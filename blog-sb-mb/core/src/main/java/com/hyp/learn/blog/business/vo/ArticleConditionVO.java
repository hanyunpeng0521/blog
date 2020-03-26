package com.hyp.learn.blog.business.vo;


import com.hyp.learn.blog.business.entity.Article;
import com.hyp.learn.blog.framework.object.BaseConditionVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = false)
public class ArticleConditionVO extends BaseConditionVO {
    private Article article;
    private Long typeId;
    private Long tagId;
    private Integer status;
    private Boolean top;
    private Boolean recommended;
    private Boolean original;
    private Boolean random;
    private List<Long> tagIds;
}

