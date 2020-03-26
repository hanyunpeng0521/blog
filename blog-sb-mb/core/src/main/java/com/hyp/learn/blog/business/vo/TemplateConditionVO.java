package com.hyp.learn.blog.business.vo;


import com.hyp.learn.blog.framework.object.BaseConditionVO;
import freemarker.template.Template;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = false)
public class TemplateConditionVO extends BaseConditionVO {
    private Template template;
}

