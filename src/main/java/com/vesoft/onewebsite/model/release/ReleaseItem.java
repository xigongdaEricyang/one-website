package com.vesoft.onewebsite.model.release;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.ViewType;
import xyz.erupt.upms.model.base.HyperModel;

@Erupt(name = "发布项类目", desc = "发布项类目", orderBy = "ReleaseItem.sort")
@Table(name = "website_release_category")
@Entity
public class ReleaseItem extends HyperModel {
  @EruptField(views = @View(title = "名称", type = ViewType.TEXT), edit = @Edit(title = "名称", type = EditType.INPUT, notNull = true))
  private String name;

  @EruptField(views = @View(title = "分类", type = ViewType.TEXT), edit = @Edit(title = "分类", type = EditType.INPUT, notNull = true))
  private String category;

  @EruptField(views = @View(title = "简介"), edit = @Edit(title = "简介", notNull = true))
  @Column(columnDefinition = "TEXT")
  private String description;

  @EruptField(views = @View(title = "发布时间", type = ViewType.TEXT), edit = @Edit(title = "发布时间", type = EditType.INPUT))
  private String release_time;

  @EruptField(views = @View(title = "排序"), edit = @Edit(title = "排序"))
  private Integer sort;

  @EruptField(views = @View(title = "Release Note", type = ViewType.HTML), edit = @Edit(title = "Release Note", type = EditType.HTML_EDITOR))
  @Column(columnDefinition = "LONGTEXT")
  private String relaese_note;

  @EruptField(views = @View(title = "下载链接", type = ViewType.LINK), edit = @Edit(title = "下载链接", type = EditType.INPUT))
  private String download_link;

  @EruptField(views = @View(title = "Github 仓库地址", type = ViewType.LINK), edit = @Edit(title = "Github 仓库地址", type = EditType.INPUT))
  private String github_repo;

  @EruptField(views = @View(title = "文档链接", type = ViewType.LINK), edit = @Edit(title = "文档链接", type = EditType.INPUT))
  private String doc_link;

  @EruptField(views = @View(title = "备注"), edit = @Edit(title = "备注", type = EditType.TEXTAREA))
  private String remark;

  @EruptField(views = @View(title = "Other", type = ViewType.CODE), edit = @Edit(title = "Other", type = EditType.CODE_EDITOR))
  private String other;
}
