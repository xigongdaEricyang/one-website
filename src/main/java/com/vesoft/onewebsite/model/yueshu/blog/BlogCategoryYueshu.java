package com.vesoft.onewebsite.model.yueshu.blog;

import xyz.erupt.upms.model.base.HyperModel;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.ViewType;
import xyz.erupt.core.annotation.EruptDataSource;

import javax.persistence.Entity;
import javax.persistence.Table;


@Erupt(name = "BLog Category", desc = "Blog Category Name", orderBy = "BlogCategoryYueshu.sort")
@Table(name = "yueshu_website_blog_category")
@Entity
public class BlogCategoryYueshu extends HyperModel {

    @EruptField(
            views = @View(title = "Category Name", type= ViewType.TEXT),
            edit = @Edit(title = "Category Name", type = EditType.INPUT, notNull = true)
    )
    private String name;

    @EruptField(
            views = @View(title = "Is Show"),
            edit = @Edit(title = "Is Show", notNull = true)
    )
    private Boolean is_show;

    @EruptField(
            views = @View(title = "Sort"),
            edit = @Edit(title = "Sort")
    )
    private Integer sort;

    @EruptField(
            views = @View(title = "Remark"),
            edit = @Edit(title = "Remark", type = EditType.TEXTAREA)
    )
    private String remark;
}