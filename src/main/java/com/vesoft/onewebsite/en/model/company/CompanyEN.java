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
@Erupt(name = "Website Company Info",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_company")
@Getter
@Setter
public class CompanyEN extends HyperModel {
    @EruptField(
            views = @View(title = "Logo", type= ViewType.IMAGE),
            edit = @Edit(title = "Logo", notNull = true, type= EditType.INPUT)
    )
    private String logo;

    @EruptField(
            views = @View(title = "Name"),
            edit = @Edit(title = "Name", search = @Search(vague = true))
    )
    private String name;

    @EruptField(
            views = @View(title = "Description"),
            edit = @Edit(title = "Description", notNull = true, search = @Search(vague = true))
    )
    private String description;

    @EruptField(
            views = @View(title = "Slug", type = ViewType.TEXT),
            edit = @Edit(title = "Slug", type = EditType.INPUT)
    )
    private String slug;

    @EruptField(
            views= @View(title = "Other", type = ViewType.CODE),
            edit = @Edit(title = "Other", type = EditType.CODE_EDITOR)
    )
    private String other;
}
