package com.hyp.learn.blog.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author hyp
 * Project name is blog
 * Include in com.hyp.learn.blog.web
 * hyp create at 20-2-2
 **/
@Controller
public class AboutShowController {

    @GetMapping("/about")
    public String about() {
        return "about";
    }
}
