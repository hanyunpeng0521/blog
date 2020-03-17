package com.hyp.learn.blog.service;

import com.hyp.learn.blog.entity.Type;
import javassist.NotFoundException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.service
 * hyp create at 20-2-2
 **/
public interface TypeService {

    Type saveType(Type type);

    Type getType(Long id);

    Type getTypeByName(String name);

    Page<Type> listType(Pageable pageable);

    List<Type> listType();

    List<Type> listTypeTop(Integer size);

    Type updateType(Long id,Type type) throws NotFoundException;

    void deleteType(Long id);
}
