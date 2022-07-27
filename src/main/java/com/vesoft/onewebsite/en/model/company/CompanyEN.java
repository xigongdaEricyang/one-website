package com.vesoft.onewebsite.en.model.company;

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

import javax.persistence.Entity;
import javax.persistence.Table;

@EruptDataSource("english_datasource")
@Erupt(name = "官网公司信息",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_company")
@Getter
@Setter
public class CompanyEN extends HyperModel {
    @EruptField(
            views = @View(title = "公司LOGO", type= ViewType.IMAGE),
            edit = @Edit(title = "公司LOGO", notNull = true, type= EditType.INPUT)
    )
    private String logo;

    @EruptField(
            views = @View(title = "名称"),
            edit = @Edit(title = "名称", search = @Search(vague = true))
    )
    private String name;

    @EruptField(
            views = @View(title = "简介"),
            edit = @Edit(title = "简介", notNull = true, search = @Search(vague = true))
    )
    private String description;

    @EruptField(
            views = @View(title = "文章id", type = ViewType.TEXT),
            edit = @Edit(title = "文章id", type = EditType.INPUT)
    )
    private String blog_id;

    @EruptField(
            views= @View(title = "其他信息", type = ViewType.CODE),
            edit = @Edit(title = "其他信息", type = EditType.CODE_EDITOR)
    )
    private String other;
}
