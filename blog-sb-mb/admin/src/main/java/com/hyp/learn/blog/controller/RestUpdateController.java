package com.hyp.learn.blog.controller;


import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.annotation.BussinessLog;
import com.hyp.learn.blog.business.entity.UpdateRecorde;
import com.hyp.learn.blog.business.enums.ResponseStatus;
import com.hyp.learn.blog.business.srvice.SysUpdateRecordeService;
import com.hyp.learn.blog.business.vo.UpdateRecordeConditionVO;
import com.hyp.learn.blog.framework.object.PageResult;
import com.hyp.learn.blog.framework.object.ResponseVO;
import com.hyp.learn.blog.utils.ResultUtil;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 系统更新日志
 */
@RestController
@RequestMapping("/update")
public class RestUpdateController {
    @Autowired
    private SysUpdateRecordeService updateRecordeService;

    @RequiresPermissions("updateLogs")
    @PostMapping("/list")
    public PageResult list(UpdateRecordeConditionVO vo) {
        PageInfo<UpdateRecorde> pageInfo = updateRecordeService.findPageBreakByCondition(vo);
        return ResultUtil.tablePage(pageInfo);
    }

    @RequiresPermissions("updateLog:add")
    @PostMapping(value = "/add")
    @BussinessLog("添加更新日志")
    public ResponseVO add(UpdateRecorde updateRecorde) {
        updateRecordeService.insert(updateRecorde);
        return ResultUtil.success("成功");
    }

    @RequiresPermissions(value = {"updateLog:batchDelete", "updateLog:delete"}, logical = Logical.OR)
    @PostMapping(value = "/remove")
    @BussinessLog("删除更新日志")
    public ResponseVO remove(Long[] ids) {
        if (null == ids) {
            return ResultUtil.error(500, "请至少选择一条记录");
        }
        for (Long id : ids) {
            updateRecordeService.removeByPrimaryKey(id);
        }
        return ResultUtil.success("成功删除 [" + ids.length + "] 个更新记录");
    }

    @RequiresPermissions("updateLog:get")
    @PostMapping("/get/{id}")
    @BussinessLog("获取更新日志详情")
    public ResponseVO get(@PathVariable Long id) {
        return ResultUtil.success(null, this.updateRecordeService.getByPrimaryKey(id));
    }

    @RequiresPermissions("updateLog:edit")
    @PostMapping("/edit")
    @BussinessLog("编辑更新日志")
    public ResponseVO edit(UpdateRecorde updateRecorde) {
        try {
            updateRecordeService.updateSelective(updateRecorde);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("更新记录修改失败！");
        }
        return ResultUtil.success(ResponseStatus.SUCCESS);
    }

}
