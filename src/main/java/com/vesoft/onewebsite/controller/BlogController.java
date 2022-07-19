package com.vesoft.onewebsite.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import xyz.erupt.core.constant.EruptRestPath;

@RestController
@RequestMapping(EruptRestPath.ERUPT_DATA_MODIFY + "/Blog")
public class BlogController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String createBlog() {
        return "hello world";
    }
}
