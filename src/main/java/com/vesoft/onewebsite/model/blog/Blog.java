package com.vesoft.onewebsite.model.blog;

import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_erupt.Tpl;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.ViewType;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.tpl.annotation.TplAction;
import xyz.erupt.upms.model.EruptUserVo;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;
import java.util.Date;
import java.util.Map;

@Erupt(name = "官网博客文章",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_blog")
public class Blog extends HyperModel implements Tpl.TplHandler {

    @EruptField(
            views = @View(title = "封面图"),
            edit = @Edit(title = "封面图", type = EditType.ATTACHMENT,
                    attachmentType = @AttachmentType(type = AttachmentType.Type.IMAGE, maxLimit = 3))
    )
    private String pic;

    @EruptField(
            views = @View(title = "标题"),
            edit = @Edit(title = "标题", notNull = true, search = @Search(vague = true))
    )
    private String title;

    @EruptField(
            views = @View(title = "作者"),
            edit = @Edit(title = "作者", notNull = true, search = @Search(vague = true))
    )
    private String author;

    @EruptField(
            views = @View(title = "描述"),
            edit = @Edit(title = "描述", notNull = true, search = @Search(vague = true))
    )
    private String description;

    @EruptField(
            views = @View(title = "发布状态"),
            edit = @Edit(title = "发布状态", notNull = true, boolType = @BoolType(trueText = "发布", falseText = "草稿"), search = @Search)
    )
    private Boolean publish;

    @Lob
    @EruptField(
            views = @View(title = "内容", type = ViewType.TEXT, export = false),
            edit = @Edit(title = "内容编辑", type = EditType.TEXTAREA,notNull = true)
    )
    private String content;

    @EruptField(
            views = @View(title = "创建时间", type = ViewType.DATE_TIME, export = false)
    )
    private Date createTime;

    @EruptField(
            views = @View(title = "更新时间", type = ViewType.DATE_TIME, export = false)
    )
    private Date updateTime;


    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Boolean getPublish() {
        return publish;
    }

    public void setPublish(Boolean publish) {
        this.publish = publish;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "Article{" +
                "pic='" + pic + '\'' +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", author='" + author + '\'' +
                ", publish=" + publish +
                ", content='" + content + '\'' +
                ", createTime='" + createTime + '\'' +
                ", updateTime='" + updateTime + '\'' +
                '}';
    }

    @Override
    public void bindTplData(Map<String, Object> binding, String[] params) {
        binding.put("data", params);
    }
}
