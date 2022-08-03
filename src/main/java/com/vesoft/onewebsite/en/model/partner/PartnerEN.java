package com.vesoft.onewebsite.en.model.partner;

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
import xyz.erupt.core.annotation.EruptDataSource;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@EruptDataSource("english_datasource")
@Erupt(name = "Website Partner Info",
        power = @Power(importable = true, export = true),
        linkTree = @LinkTree(field = "partner_category")
)
@Entity()
@Table(name = "website_partner")
@Getter
@Setter
public class PartnerEN extends HyperModel {
    @EruptField(
            views = @View(title = "Logo", type= ViewType.IMAGE),
            edit = @Edit(title = "Logo", type = EditType.INPUT)
    )
    private String logo;

    @EruptField(
            views = @View(title = "Description", type= ViewType.TEXT),
            edit = @Edit(title = "Description", type = EditType.TEXTAREA)
    )
    private String description;

    @ManyToOne
    @EruptField(
            views = @View(title = "Category", column = "name"),
            edit = @Edit(title = "Category", notNull = true, type = EditType.REFERENCE_TREE)
    )
    private PartnerCategoryEN partner_category;

    @EruptField(
            views = @View(title = "Blog Slug", type = ViewType.TEXT),
            edit = @Edit(title = "Blog Slug", type = EditType.INPUT)
    )
    private String blog_slug;

    @EruptField(
            views= @View(title = "Other", type = ViewType.CODE),
            edit = @Edit(title = "Other", type = EditType.CODE_EDITOR)
    )
    private String other;
}
