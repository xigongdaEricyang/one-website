package com.vesoft.onewebsite.en.model.blog;

import com.vesoft.onewebsite.en.model.base.HyperModel;
import lombok.Getter;
import lombok.Setter;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.LinkTree;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.ViewType;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.core.annotation.EruptDataSource;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@EruptDataSource("english_datasource")
@Erupt(name = "Website Blog",
        power = @Power(importable = true, export = true),
        linkTree = @LinkTree(field = "blog_category")
)
@Entity
@Table(name = "website_blog")
@Getter
@Setter
public class BlogEN extends HyperModel {

    @EruptField(
            views = @View(title = "Cover"),
            edit = @Edit(title = "Cover", type = EditType.ATTACHMENT,
                    attachmentType = @AttachmentType(type = AttachmentType.Type.IMAGE, maxLimit = 3))
    )
    private String pic;

    @EruptField(
            views = @View(title = "Title"),
            edit = @Edit(title = "Title", notNull = true, search = @Search(vague = true))
    )
    private String title;

    @EruptField(
            views = @View(title = "Slug"),
            edit = @Edit(title = "Slug", notNull = true, search = @Search(vague = true))
    )
    private String slug;

    @EruptField(
            views = @View(title = "Author"),
            edit = @Edit(title = "Author", notNull = true, search = @Search(vague = true))
    )
    private String author;

    @ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH})
    @JoinTable(
            name = "website_blog_tag_join",
            joinColumns = @JoinColumn(name = "blog_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id", referencedColumnName = "id"))
    @EruptField(
            edit = @Edit(title = "Tag", type = EditType.TAB_TREE,
                    referenceTableType = @ReferenceTableType(label = "tag"))
    )
    private Set<BlogTagEN> tags;

    @ManyToOne
    @EruptField(
            views = @View(title = "Category", column = "name"),
            edit = @Edit(title = "Category", notNull = true, type = EditType.REFERENCE_TREE)
    )
    private BlogCategoryEN blog_category;

    @EruptField(
            views = @View(title = "Description"),
            edit = @Edit(title = "Description", notNull = true, search = @Search(vague = true))
    )
    private String description;

    @EruptField(
            views = @View(title = "status"),
            edit = @Edit(title = "status", notNull = true, boolType = @BoolType(trueText = "publish", falseText = "draft"), search = @Search)
    )
    private Boolean publish;

    @Lob
    @EruptField(
            views = @View(title = "content", type = ViewType.TEXT, export = false),
            edit = @Edit(title = "Content Edit", type = EditType.TEXTAREA,notNull = true)
    )
    @Column(columnDefinition = "LONGTEXT NOT NULL")
    private String content;

    @EruptField(
            views = @View(title = "Create Time", type = ViewType.DATE_TIME, export = false)
    )
    private Date createTime;

    @EruptField(
            views = @View(title = "Update Time", type = ViewType.DATE_TIME, export = false)
    )
    private Date updateTime;

}
