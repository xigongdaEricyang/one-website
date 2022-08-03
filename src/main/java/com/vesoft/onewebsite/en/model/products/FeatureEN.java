package com.vesoft.onewebsite.en.model.products;

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
import xyz.erupt.annotation.sub_field.sub_edit.AttachmentType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.core.annotation.EruptDataSource;

import javax.persistence.Entity;
import javax.persistence.Table;

@EruptDataSource("english_datasource")
@Erupt(name = "Website Product Feature",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_product_feature")
@Getter
@Setter
public class FeatureEN extends HyperModel {
    @EruptField(
            views = @View(title = "Content"),
            edit = @Edit(title = "Content", notNull = true, search = @Search(vague = true))
    )
    private String content;

    @EruptField(
            views = @View(title = "Subtitle"),
            edit = @Edit(title = "Subtitle", search = @Search(vague = true))
    )
    private String subContent;

    @EruptField(
            views = @View(title = "Description"),
            edit = @Edit(title = "Description", notNull = true, search = @Search(vague = true))
    )
    private String description;

    @EruptField(
            views = @View(title = "Pic Link", type = ViewType.IMAGE),
            edit = @Edit(title = "Pic Link", type = EditType.INPUT)
    )
    private String link;
}

