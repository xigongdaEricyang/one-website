package com.vesoft.onewebsite.handler;

import com.alibaba.fastjson2.JSONObject;
import com.vesoft.onewebsite.en.model.blog.BlogEN;
import com.vesoft.onewebsite.model.blog.Blog;
import com.vesoft.onewebsite.model.yueshu.blog.BlogYueshu;
import com.vesoft.onewebsite.service.BlogService;
import org.quartz.SchedulerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.erupt.core.annotation.EruptHandlerNaming;
import xyz.erupt.job.handler.EruptJobHandler;

import javax.annotation.Resource;
import java.text.ParseException;

@Service
@EruptHandlerNaming("博客文章定时发布任务")
public class BlogJobHandler implements EruptJobHandler {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    BlogService blogService;

    @Override
    public String exec(String code, String param) {
        JSONObject obj = JSONObject.parseObject(param);
        Long blog_id = obj.getLongValue("id");
        Boolean isEn = obj.getBoolean("isEn");
        String platform = obj.getString("platform");
        logger.info("博客定时发布任务已经执行，执行文章id:{}, 发布平台为: {}",blog_id, platform);
        String result;
        if (platform == "yueshu") {
          BlogYueshu blog = blogService.publishBlogYueShuById(blog_id);
            if (blog == null) {
                result = "博客定时发布执行失败，待执行文章不存在，id为: " + blog.getTitle();
            } else {
                result = "博客定时发布执行成功，执行文章标题为: " + blog.getTitle();
            }
        } else if (isEn == null || isEn == false) {
            Blog blog = blogService.publishBlogById(blog_id);
            if (blog == null) {
                result = "博客定时发布执行失败，待执行文章不存在，id为: " + blog.getTitle();
            } else {
                result = "博客定时发布执行成功，执行文章标题为: " + blog.getTitle();
            }
        } else {
            BlogEN blog = blogService.publishBlogENById(blog_id);
            if (blog == null) {
                result = "博客定时发布执行失败，待执行文章不存在，id为: " + blog.getTitle();
            } else {
                result = "博客定时发布执行成功，执行文章标题为: " + blog.getTitle();
            }
        }
        try {
            blogService.bidJobSchedule(code);
        } catch (SchedulerException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void success(String result, String param) {
        EruptJobHandler.super.success(result, param);
    }

    @Override
    public void error(Throwable throwable, String param) {
        EruptJobHandler.super.error(throwable, param);
    }
}
