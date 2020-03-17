package com.hyp.learn.blog.service;

import com.hyp.learn.blog.entity.Blog;
import com.hyp.learn.blog.vo.BlogQuery;
import javassist.NotFoundException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.service
 * hyp create at 20-2-2
 **/
public interface BlogService {

    Blog getBlog(Long id);

    Blog getAndConvert(Long id) throws NotFoundException;

    Page<Blog> listBlog(Pageable pageable, BlogQuery blog);

    Page<Blog> listBlog(Pageable pageable);

    Page<Blog> listBlog(Long tagId, Pageable pageable);

    Page<Blog> listBlog(String query, Pageable pageable);

    List<Blog> listRecommendBlogTop(Integer size);

    Map<String, List<Blog>> archiveBlog();

    Long countBlog();

    Blog saveBlog(Blog blog);

    Blog updateBlog(Long id, Blog blog) throws NotFoundException;

    void deleteBlog(Long id);
}
