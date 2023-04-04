package com.vesoft.onewebsite.model.yueshu.products;

import xyz.erupt.upms.model.base.HyperModel;
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


@Erupt(name = "Website Product Advantage",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "yueshu_website_product_advantage")
@Getter
@Setter
public class AdvantageYueshu extends HyperModel {
    @EruptField(
            views = @View(title = "title"),
            edit = @Edit(title = "title", notNull = true, search = @Search(vague = true))
    )
    private String content;

    @EruptField(
            views = @View(title = "Description"),
            edit = @Edit(title = "Description", type = EditType.TEXTAREA, notNull = true, search = @Search(vague = true))
    )
    @Column(columnDefinition = "TEXT")
    private String description;

    @EruptField(
            views = @View(title = "Pic Link", type = ViewType.IMAGE),
            edit = @Edit(title = "Pic Link", type = EditType.INPUT)
    )
    private String link;

    @EruptField(views = @View(title = "Sort"), edit = @Edit(title = "Sort"))
    private Integer sort;
}
