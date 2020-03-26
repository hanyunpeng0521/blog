package com.hyp.learn.blog.business.srvice;


import com.hyp.learn.blog.business.entity.Comment;
import com.hyp.learn.blog.business.entity.Link;
import com.hyp.learn.blog.business.entity.MailDetail;
import com.hyp.learn.blog.business.enums.TemplateKeyEnum;

/**
 * 邮件发送
 */
public interface MailService {

    /**
     * 普通的发送
     *
     * @param mailDetail
     * @return
     */
    void send(MailDetail mailDetail);

    /**
     * 发送友情链接邮件通知
     *
     * @param link
     * @param keyEnum
     * @return
     */
    void send(Link link, TemplateKeyEnum keyEnum);

    /**
     * 发送评论邮件通知
     *
     * @param comment
     * @param keyEnum
     * @param audit
     * @return
     */
    void send(Comment comment, TemplateKeyEnum keyEnum, boolean audit);

    /**
     * 发送到管理员的友链操作通知
     *
     * @param link
     */
    void sendToAdmin(Link link);

    /**
     * 发送到管理员的评论通知
     *
     * @param comment
     */
    void sendToAdmin(Comment comment);
}
