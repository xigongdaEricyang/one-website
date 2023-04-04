package com.vesoft.onewebsite.model.yueshu.release;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import xyz.erupt.upms.model.base.HyperModel;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.ViewType;
import xyz.erupt.core.annotation.EruptDataSource;

@Erupt(name = "Release Item", desc = "Release Item", orderBy = "ReleaseItemYueshu.sort")
@Table(name = "yueshu_website_release_category")
@Entity
public class ReleaseItemYueshu extends HyperModel {
    @EruptField(views = @View(title = "Name", type = ViewType.TEXT), edit = @Edit(title = "Name", type = EditType.INPUT, notNull = true))
    private String name;

    @EruptField(views = @View(title = "Category", type = ViewType.TEXT), edit = @Edit(title = "Category", type = EditType.INPUT, notNull = true))
    private String category;

    @EruptField(views = @View(title = "Description"), edit = @Edit(title = "Description", notNull = true))
    @Column(columnDefinition = "TEXT")
    private String description;

    @EruptField(views = @View(title = "Release Time", type = ViewType.TEXT), edit = @Edit(title = "发布时间", type = EditType.INPUT))
    private String release_time;

    @EruptField(views = @View(title = "Sort"), edit = @Edit(title = "Sort"))
    private Integer sort;

    @EruptField(views = @View(title = "Release Note", type = ViewType.HTML), edit = @Edit(title = "Release Note", type = EditType.HTML_EDITOR))
    @Column(columnDefinition = "LONGTEXT")
    private String relaese_note;

    @EruptField(views = @View(title = "Release Note", type = ViewType.LINK), edit = @Edit(title = "Release Note", type = EditType.INPUT))
    private String download_link;

    @EruptField(views = @View(title = "Github Repo", type = ViewType.LINK), edit = @Edit(title = "Github Repo", type = EditType.INPUT))
    private String github_repo;

    @EruptField(views = @View(title = "Doc Link", type = ViewType.LINK), edit = @Edit(title = "Doc Link", type = EditType.INPUT))
    private String doc_link;

    @EruptField(views = @View(title = "Remark"), edit = @Edit(title = "Remark", type = EditType.TEXTAREA))
    private String remark;

    @EruptField(views = @View(title = "Other", type = ViewType.CODE), edit = @Edit(title = "Other", type = EditType.CODE_EDITOR))
    private String other;
}
