package com.hyp.learn.blog.plugin.file;

import com.hyp.learn.blog.business.entity.File;
import com.hyp.learn.blog.business.entity.User;
import com.hyp.learn.blog.business.enums.ConfigKeyEnum;
import com.hyp.learn.blog.business.srvice.PxFileService;
import com.hyp.learn.blog.business.srvice.SysConfigService;
import com.hyp.learn.blog.file.AliyunOssApiClient;
import com.hyp.learn.blog.file.ApiClient;
import com.hyp.learn.blog.file.LocalApiClient;
import com.hyp.learn.blog.file.QiniuApiClient;
import com.hyp.learn.blog.file.entity.VFile;
import com.hyp.learn.blog.file.exception.GlobalFileException;
import com.hyp.learn.blog.framework.exception.PxException;
import com.hyp.learn.blog.framework.holder.SpringContextHolder;
import com.hyp.learn.blog.persistence.beans.PxFile;
import com.hyp.learn.blog.utils.BeanConvertUtil;
import com.hyp.learn.blog.utils.SessionUtil;
import org.springframework.util.StringUtils;

import java.util.Map;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.plugin.file
 * hyp create at 20-3-18
 **/
public class BaseFileUploader {

    ApiClient getApiClient(String uploadType) {
        SysConfigService configService = SpringContextHolder.getBean(SysConfigService.class);
        Map<String, Object> config = configService.getConfigs();
        String storageType = null;
        if (null == config || StringUtils.isEmpty((storageType = (String) config.get(ConfigKeyEnum.STORAGE_TYPE.getKey())))) {
            throw new PxException("[文件服务]当前系统暂未配置文件服务相关的内容！");
        }

        ApiClient res = null;
        switch (storageType) {
            case "local":
                String localFileUrl = (String) config.get(ConfigKeyEnum.LOCAL_FILE_URL.getKey()),
                        localFilePath = (String) config.get(ConfigKeyEnum.LOCAL_FILE_PATH.getKey());
                res = new LocalApiClient().init(localFileUrl, localFilePath, uploadType);
                break;
            case "qiniu":
                String accessKey = (String) config.get(ConfigKeyEnum.QINIU_ACCESS_KEY.getKey()),
                        secretKey = (String) config.get(ConfigKeyEnum.QINIU_SECRET_KEY.getKey()),
                        qiniuBucketName = (String) config.get(ConfigKeyEnum.QINIU_BUCKET_NAME.getKey()),
                        baseUrl = (String) config.get(ConfigKeyEnum.QINIU_BASE_PATH.getKey());
                res = new QiniuApiClient().init(accessKey, secretKey, qiniuBucketName, baseUrl, uploadType);
                break;
            case "aliyun":
                String endpoint = (String) config.get(ConfigKeyEnum.ALIYUN_ENDPOINT.getKey()),
                        accessKeyId = (String) config.get(ConfigKeyEnum.ALIYUN_ACCESS_KEY.getKey()),
                        accessKeySecret = (String) config.get(ConfigKeyEnum.ALIYUN_ACCESS_KEY_SECRET.getKey()),
                        url = (String) config.get(ConfigKeyEnum.ALIYUN_FILE_URL.getKey()),
                        aliYunBucketName = (String) config.get(ConfigKeyEnum.ALIYUN_BUCKET_NAME.getKey());
                res = new AliyunOssApiClient().init(endpoint, accessKeyId, accessKeySecret, url, aliYunBucketName, uploadType);
                break;
            case "youpaiyun":
                break;
            default:
                break;
        }
        if (null == res) {
            throw new GlobalFileException("[文件服务]当前系统暂未配置文件服务相关的内容！");
        }
        return res;
    }

    VFile saveFile(VFile virtualFile, boolean save, String uploadType) {
        if (save) {
            PxFileService fileService = SpringContextHolder.getBean(PxFileService.class);
            try {
                SysConfigService configService = SpringContextHolder.getBean(SysConfigService.class);
                Map<String, Object> config = configService.getConfigs();
                String storageType = (String) config.get(ConfigKeyEnum.STORAGE_TYPE.getKey());

                PxFile fileInfo = BeanConvertUtil.doConvert(virtualFile, PxFile.class);
                User sessionUser = SessionUtil.getUser();
                fileInfo.setUserId(null == sessionUser ? null : sessionUser.getId());
                fileInfo.setUploadType(uploadType);
                fileInfo.setStorageType(storageType);
                fileService.insert(new File(fileInfo));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return virtualFile;
    }

    boolean removeFile(ApiClient apiClient, String filePath, String uploadType) {
        PxFileService fileService = SpringContextHolder.getBean(PxFileService.class);
        File file = fileService.selectFileByPathAndUploadType(filePath, uploadType);
        String fileKey = filePath;
        if (null != file) {
            fileKey = file.getFilePath();
        }
        return apiClient.removeFile(fileKey);
    }

}
