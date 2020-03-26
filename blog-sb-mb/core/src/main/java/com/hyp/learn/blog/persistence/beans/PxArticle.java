package com.hyp.learn.blog.persistence.beans;


import com.hyp.learn.blog.framework.object.AbstractDO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = false)
public class PxArticle extends AbstractDO {
    @Transient
    List<PxTags> tags;
    @Transient
    PxType pxType;
    private String title;
    private Long userId;
    private String coverImage;
    private String qrcodePath;
    private Boolean isMarkdown;
    private String content;
    private String contentMd;
    private Boolean top;
    private Long typeId;
    private Integer status;
    private Boolean recommended;
    private Boolean original;
    private String description;
    private String keywords;
    private Boolean comment;
    @Transient
    private Integer lookCount;
    @Transient
    private Integer commentCount;
    @Transient
    private Integer loveCount;
}
