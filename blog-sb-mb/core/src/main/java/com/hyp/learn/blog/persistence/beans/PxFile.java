package com.hyp.learn.blog.persistence.beans;

import com.hyp.learn.blog.framework.object.AbstractDO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Column;
import java.util.Date;

/**
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PxFile extends AbstractDO {
    @Column(name = "`size`")
    public Long size;
    public String suffix;
    public Integer width;
    public Integer height;
    private Long userId;
    private String originalFileName;
    private String filePath;
    private String fullFilePath;
    private String fileHash;
    private String uploadType;
    private Date uploadStartTime;
    private Date uploadEndTime;

    private String storageType;
}
