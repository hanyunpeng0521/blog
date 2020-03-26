package com.hyp.learn.blog.business.aspect;

import com.hyp.learn.blog.business.annotation.RedisCache;
import com.hyp.learn.blog.business.srvice.RedisService;
import com.hyp.learn.blog.utils.AspectUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * Redis业务层数据缓存
 *
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.core.business.aspect
 * hyp create at 20-3-19
 **/
@Slf4j
@Aspect
@Component
public class RedisCacheAspect {

    private static final String BIZ_CACHE_PREFIX = "px_cache_";

    @Autowired
    private RedisService redisService;

    @Pointcut(value = "@annotation(com.hyp.learn.blog.business.annotation.RedisCache)")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object handle(ProceedingJoinPoint point) throws Throwable {
        Method currentMethod = AspectUtil.INSTANCE.getMethod(point);
        //获取操作名称
        RedisCache cache = currentMethod.getAnnotation(RedisCache.class);
        boolean enable = cache.enable();
        if (!enable) {
            return point.proceed();
        }
        boolean flush = cache.flush();
        if (flush) {
            String classPrefix = AspectUtil.INSTANCE.getKey(point, BIZ_CACHE_PREFIX);
            log.info("清空缓存 - {}*", classPrefix);
            redisService.delBatch(classPrefix);
            return point.proceed();
        }
        String key = AspectUtil.INSTANCE.getKey(point, cache.key(), BIZ_CACHE_PREFIX);
        boolean hasKey = redisService.hasKey(key);
        if (hasKey) {
            try {
                log.info("{}从缓存中获取数据", key);
                return redisService.get(key);
            } catch (Exception e) {
                log.error("从缓存中获取数据失败！", e);
            }
        }
        //先执行业务
        Object result = point.proceed();
        redisService.set(key, result, cache.expire(), cache.unit());
        log.info("{}从数据库中获取数据", key);
        return result;
    }
}