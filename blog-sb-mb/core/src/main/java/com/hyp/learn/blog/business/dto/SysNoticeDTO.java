package com.hyp.learn.blog.business.dto;

import lombok.Data;

/**
 * 系统通知详情，用于页面传输
 */
@Data
public class SysNoticeDTO {
    private String title;
    private String content;
}
