package com.hyp.learn.blog.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.hyp.learn.blog.business.enums.CommentStatusEnum;
import com.hyp.learn.blog.business.enums.ExtraCommentTypeEnum;
import com.hyp.learn.blog.persistence.beans.PxArticle;
import com.hyp.learn.blog.persistence.beans.PxComment;
import com.hyp.learn.blog.utils.HtmlUtil;
import org.springframework.util.StringUtils;

import java.util.Date;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Comment {
    private PxComment pxComment;

    public Comment() {
        this.pxComment = new PxComment();
    }

    public Comment(PxComment pxComment) {
        this.pxComment = pxComment;
    }

    @JsonIgnore
    public PxComment getPxComment() {
        return this.pxComment;
    }

    public Long getId() {
        return this.pxComment.getId();
    }

    public void setId(Long id) {
        this.pxComment.setId(id);
    }

    public Long getSid() {
        return this.pxComment.getSid();
    }

    public void setSid(Long sid) {
        this.pxComment.setSid(sid);
    }

    /**
     * 获取评论文章的地址
     *
     * @return
     */
    public String getSourceUrl() {
        Long sid = getSid();
        ExtraCommentTypeEnum extraCommentType = ExtraCommentTypeEnum.getBySid(sid);
        if (null == extraCommentType) {
            return "";
        }
        if (extraCommentType.equals(ExtraCommentTypeEnum.ARTICLE)) {
            return extraCommentType.getUrl() + sid;
        }
        return extraCommentType.getUrl();
    }

    public String getArticleTitle() {
        PxArticle article = this.getArticle();
        String title = null == article ? null : article.getTitle();
        if (title == null) {
            Long sid = getSid();
            ExtraCommentTypeEnum extraCommentType = ExtraCommentTypeEnum.getBySid(sid);
            title = extraCommentType.getTitle();
        }
        return title;
    }

    public Long getUserId() {
        return this.pxComment.getUserId();
    }

    public void setUserId(Long userId) {
        this.pxComment.setUserId(userId);
    }

    public Long getPid() {
        return this.pxComment.getPid();
    }

    public void setPid(Long pid) {
        this.pxComment.setPid(pid);
    }

    public String getQq() {
        return this.pxComment.getQq();
    }

    public void setQq(String qq) {
        this.pxComment.setQq(qq);
    }

    public String getNickname() {
        return this.pxComment.getNickname();
    }

    public void setNickname(String nickname) {
        this.pxComment.setNickname(nickname);
    }

    public String getAvatar() {
        return this.pxComment.getAvatar();
    }

    public void setAvatar(String avatar) {
        this.pxComment.setAvatar(avatar);
    }

    public String getEmail() {
        return this.pxComment.getEmail();
    }

    public void setEmail(String email) {
        this.pxComment.setEmail(email);
    }

    public String getUrl() {
        return this.pxComment.getUrl();
    }

    public void setUrl(String url) {
        this.pxComment.setUrl(url);
    }

    public String getStatus() {
        return this.pxComment.getStatus();
    }

    public void setStatus(String status) {
        this.pxComment.setStatus(status);
    }

    public String getStatusDesc() {
        return CommentStatusEnum.valueOf(this.pxComment.getStatus()).getDesc();
    }

    public String getIp() {
        return this.pxComment.getIp();
    }

    public void setIp(String ip) {
        this.pxComment.setIp(ip);
    }

    public String getLng() {
        return this.pxComment.getLng();
    }

    public void setLng(String lng) {
        this.pxComment.setLng(lng);
    }

    public String getLat() {
        return this.pxComment.getLat();
    }

    public void setLat(String lat) {
        this.pxComment.setLat(lat);
    }

    public String getAddress() {
        return this.pxComment.getAddress();
    }

    public void setAddress(String address) {
        this.pxComment.setAddress(address);
    }

    public String getOs() {
        return this.pxComment.getOs();
    }

    public void setOs(String os) {
        this.pxComment.setOs(os);
    }

    public String getOsShortName() {
        return this.pxComment.getOsShortName();
    }

    public void setOsShortName(String osShortName) {
        this.pxComment.setOsShortName(osShortName);
    }

    public String getBrowser() {
        return this.pxComment.getBrowser();
    }

    public void setBrowser(String browser) {
        this.pxComment.setBrowser(browser);
    }

    public String getBrowserShortName() {
        return this.pxComment.getBrowserShortName();
    }

    public void setBrowserShortName(String browserShortName) {
        this.pxComment.setBrowserShortName(browserShortName);
    }

    public String getContent() {
        return this.pxComment.getContent();
    }

    public void setContent(String content) {
        this.pxComment.setContent(content);
    }

    /**
     * 简短内容
     *
     * @return
     */
    public String getBriefContent() {
        String content = getContent();
        if (!StringUtils.isEmpty(content)) {
            content = HtmlUtil.html2Text(content);
            if (content.length() > 15) {
                content = content.substring(0, 15) + "...";
            }
        }
        return content;
    }

    public String getRemark() {
        return this.pxComment.getRemark();
    }

    public void setRemark(String remark) {
        this.pxComment.setRemark(remark);
    }

    public Integer getSupport() {
        return this.pxComment.getSupport();
    }

    public void setSupport(Integer support) {
        this.pxComment.setSupport(support);
    }

    public Integer getOppose() {
        return this.pxComment.getOppose();
    }

    public void setOppose(Integer oppose) {
        this.pxComment.setOppose(oppose);
    }

    public Date getCreateTime() {
        return this.pxComment.getCreateTime();
    }

    public void setCreateTime(Date createTime) {
        this.pxComment.setCreateTime(createTime);
    }

    public Date getUpdateTime() {
        return this.pxComment.getUpdateTime();
    }

    public void setUpdateTime(Date updateTime) {
        this.pxComment.setUpdateTime(updateTime);
    }

    public PxComment getParent() {
        return this.pxComment.getParent();
    }

    public void setParent(PxComment parent) {
        this.pxComment.setParent(parent);
    }

    public PxArticle getArticle() {
        return this.pxComment.getArticle();
    }

    public void getArticle(PxArticle article) {
        this.pxComment.setArticle(article);
    }

    public User getUser() {
        return null == this.pxComment.getUser() ? null : new User(this.pxComment.getUser());
    }

}

