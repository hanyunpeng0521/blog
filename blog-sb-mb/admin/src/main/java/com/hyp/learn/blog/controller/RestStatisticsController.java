package com.hyp.learn.blog.controller;


import com.hyp.learn.blog.business.srvice.PxStatisticsService;
import com.hyp.learn.blog.business.srvice.SysConfigService;
import com.hyp.learn.blog.framework.object.ResponseVO;
import com.hyp.learn.blog.utils.ResultUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/statistics")
public class RestStatisticsController {

    @Autowired
    private SysConfigService configService;
    @Autowired
    private PxStatisticsService statisticsService;

    @RequestMapping("/siteInfo")
    public ResponseVO getSiteInfo() {
        return ResultUtil.success("", configService.getSiteInfo());
    }

    @RequestMapping("/listSpider")
    public ResponseVO listSpider() {
        return ResultUtil.success("", statisticsService.listSpider(10));
    }

    @RequestMapping("/listType")
    public ResponseVO listType() {
        return ResultUtil.success("", statisticsService.listType(10));
    }

}
