package com.hyp.learn.blog.business.srvice;


import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.entity.Template;
import com.hyp.learn.blog.business.enums.TemplateKeyEnum;
import com.hyp.learn.blog.business.vo.TemplateConditionVO;
import com.hyp.learn.blog.framework.object.AbstractService;

/**
 * 系统模板
 */
public interface SysTemplateService extends AbstractService<Template, Long> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfo<Template> findPageBreakByCondition(TemplateConditionVO vo);

    /**
     * 通过key获取模板信息
     *
     * @param key
     * @return
     */
    Template getTemplate(TemplateKeyEnum key);

    /**
     * 通过key获取模板信息
     *
     * @param key
     * @return
     */
    Template getTemplate(String key);
}
