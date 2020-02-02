package com.hyp.learn.blog.dao;

import com.hyp.learn.blog.entity.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.dao
 * hyp create at 20-2-2
 **/
public interface BlogRepository extends JpaRepository<Blog, Long>, JpaSpecificationExecutor<Blog> {
    @Query("select b from Blog b where b.recommend = true")
    List<Blog> findTop(Pageable pageable);

    @Query("select b from Blog b where b.title like ?1 or b.content like ?1")
    Page<Blog> findByQuery(String query, Pageable pageable);


    @Transactional
    @Modifying
    @Query("update Blog b set b.views = b.views+1 where b.id = ?1")
    int updateViews(Long id);

    @Query("select function('year',b.updateTime) as year from Blog b group by function('year',b.updateTime) order by year desc ")
    List<String> findGroupYear();

    @Query("select b from Blog b where b.updateTime like ?1% ")
    List<Blog> findByYear(String year);
}
