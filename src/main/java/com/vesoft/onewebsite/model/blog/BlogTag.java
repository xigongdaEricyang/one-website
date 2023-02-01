package com.vesoft.onewebsite.model.blog;

import lombok.Getter;
import lombok.Setter;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.ViewType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


@Erupt(name = "官网博客标签",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_blog_tag")
@Getter
@Setter
public class BlogTag extends HyperModel {

    @EruptField(
            views = @View(title = "标签名称"),
            edit = @Edit(title = "标签名称", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @EruptField(
            views= @View(title = "其他信息", type = ViewType.CODE),
            edit = @Edit(title = "其他信息", type = EditType.CODE_EDITOR)
    )
    @Column(columnDefinition = "LONGTEXT")
    private String other;
}
