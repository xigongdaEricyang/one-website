package com.vesoft.onewebsite.service;

import com.vesoft.onewebsite.en.model.blog.BlogEN;
import com.vesoft.onewebsite.model.blog.Blog;
import org.quartz.SchedulerException;
import org.springframework.stereotype.Service;
import xyz.erupt.job.config.EruptJobProp;
import xyz.erupt.job.model.EruptJob;
import xyz.erupt.job.service.EruptJobService;
import xyz.erupt.jpa.dao.EruptDao;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.Date;

@Service
@Transactional
public class BlogService {

    @Resource
    private EruptDao eruptDao;


    @Resource
    private EruptJobService eruptJobService;

    @Resource
    private EruptJobProp eruptJobProp;

    public Blog publishBlogById(Long blogId) {
        Blog blog = eruptDao.getEntityManager().find(Blog.class, blogId);
        if (blog == null) {
            return null;
        }
        if (blog.getPublish() == false) {
            Date now = new Date();
            blog.setPublish(true);
            blog.setUpdateTime(now);
            blog.setPublishTime(now);
            eruptDao.getEntityManager().merge(blog);
        }
        return blog;
    }

    public BlogEN publishBlogENById(Long blogId) {
        EntityManager entityManager = eruptDao.getEntityManager("english_datasource");
        BlogEN blogen = entityManager.find(BlogEN.class, blogId);
        if (blogen == null) {
            return null;
        }
        if (blogen.getPublish() == false) {
            Date now = new Date();
            blogen.setPublish(true);
            blogen.setUpdateTime(now);
            blogen.setPublishTime(now);
            entityManager.merge(blogen);
        }
        entityManager.close();
        return blogen;
    }

    public void bidJobSchedule(String code) throws SchedulerException, ParseException {
        if (eruptJobProp.isEnable()) {
            String expr = "code = '" + code + "'";
            EruptJob job =  eruptDao.queryEntity(EruptJob.class, expr);
            job.setStatus(false);
            job.setUpdateTime(LocalDateTime.now());
            eruptJobService.modifyJob(job);
        }
    }
}
