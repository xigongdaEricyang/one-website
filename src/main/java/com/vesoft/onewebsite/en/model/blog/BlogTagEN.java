package com.vesoft.onewebsite.en.model.blog;

import com.vesoft.onewebsite.en.model.base.HyperModel;
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
import xyz.erupt.core.annotation.EruptDataSource;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@EruptDataSource("english_datasource")
@Erupt(name = "Website Blog Tag",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_blog_tag")
@Getter
@Setter
public class BlogTagEN extends HyperModel {

    @EruptField(
            views = @View(title = "Tag Name"),
            edit = @Edit(title = "Tag Name", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @EruptField(
            views= @View(title = "Other", type = ViewType.CODE),
            edit = @Edit(title = "Other", type = EditType.CODE_EDITOR)
    )
    @Column(columnDefinition = "LONGTEXT")
    private String other;
}
