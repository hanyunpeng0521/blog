package com.hyp.learn.blog.framework.object;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.hyp.learn.blog.business.enums.ResponseStatus;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Collection;
import java.util.List;

/**
 * controller返回json
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.framework.object
 * hyp create at 20-3-18
 **/
@Data
@EqualsAndHashCode(callSuper = false)
public class ResponseVO<T> {
    //状态
    private Integer status;
    //信息
    private String message;
    //数据
    private T data;

    public ResponseVO(Integer status, String message, T data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public ResponseVO(ResponseStatus status, T data) {
        this(status.getCode(), status.getMessage(), data);
    }

    public String toJson() {
        T t = this.getData();
        if (t instanceof List || t instanceof Collection) {
            return JSONObject.toJSONString(this, SerializerFeature.WriteNullListAsEmpty);
        } else {
            return JSONObject.toJSONString(this, SerializerFeature.WriteMapNullValue);
        }
    }
}
