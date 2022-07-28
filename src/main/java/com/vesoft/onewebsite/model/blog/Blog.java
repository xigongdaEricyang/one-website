package com.vesoft.onewebsite.model.blog;

import lombok.Getter;
import lombok.Setter;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_erupt.Tpl;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.ViewType;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.*;
import java.util.Date;
import java.util.Map;
import java.util.Set;

@Erupt(name = "官网博客文章",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_blog")
@Getter
@Setter
public class Blog extends HyperModel {

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

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name="blog_id")
    @EruptField(
            views = @View(title = "标签", type=ViewType.TEXT),
            edit = @Edit(title = "标签", type = EditType.TAB_TABLE_ADD, search = @Search(vague = true))
    )
    private Set<BlogTag> tags;

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
    @Column(columnDefinition = "LONGTEXT NOT NULL")
    private String content;

    @EruptField(
            views = @View(title = "创建时间", type = ViewType.DATE_TIME, export = false)
    )
    @Column(name = "create_time")
    private Date createTime;

    @EruptField(
            views = @View(title = "更新时间", type = ViewType.DATE_TIME, export = false)
    )
    @Column(name = "update_time")
    private Date updateTime;
}
