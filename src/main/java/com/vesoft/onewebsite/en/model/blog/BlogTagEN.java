package com.vesoft.onewebsite.en.model.blog;

import com.vesoft.onewebsite.en.model.base.HyperModel;
import lombok.Getter;
import lombok.Setter;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.core.annotation.EruptDataSource;

import javax.persistence.Entity;
import javax.persistence.Table;

@EruptDataSource("english_datasource")
@Erupt(name = "官网博客标签",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_blog_tag")
@Getter
@Setter
public class BlogTagEN extends HyperModel {

    @EruptField(
            views = @View(title = "标签名称"),
            edit = @Edit(title = "标签名称", notNull = true, search = @Search(vague = true))
    )
    private String name;
}
