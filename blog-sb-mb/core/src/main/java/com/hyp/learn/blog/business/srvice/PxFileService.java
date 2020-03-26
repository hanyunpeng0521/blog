package com.hyp.learn.blog.business.srvice;


import com.github.pagehelper.PageInfo;
import com.hyp.learn.blog.business.entity.File;
import com.hyp.learn.blog.business.vo.FileConditionVO;
import com.hyp.learn.blog.framework.object.AbstractService;
import org.springframework.web.multipart.MultipartFile;


public interface PxFileService extends AbstractService<File, Long> {

    PageInfo<File> findPageBreakByCondition(FileConditionVO vo);

    File selectFileByPathAndUploadType(String filePath, String uploadType);

    void remove(Long[] ids);

    int upload(MultipartFile[] file);
}
