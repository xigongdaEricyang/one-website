package com.vesoft.onewebsite.model.products;

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
import xyz.erupt.jpa.model.BaseModel;
import xyz.erupt.upms.model.base.HyperModel;
import lombok.Getter;

import javax.persistence.Entity;
import javax.persistence.Table;

@Erupt(name = "官网产品特性",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_product_feature")
@Getter
@Setter
public class Feature extends HyperModel {
    @EruptField(
            views = @View(title = "简要特性"),
            edit = @Edit(title = "简要特性", notNull = true, search = @Search(vague = true))
    )
    private String content;

    @EruptField(
            views = @View(title = "副标题"),
            edit = @Edit(title = "副标题", search = @Search(vague = true))
    )
    private String subContent;

    @EruptField(
            views = @View(title = "简要特性描述"),
            edit = @Edit(title = "简要特性描述", notNull = true, search = @Search(vague = true))
    )
    private String description;

    @EruptField(
            views = @View(title = "描述图片", type = ViewType.IMAGE),
            edit = @Edit(title = "描述图片", type = EditType.INPUT)
    )
    private String link;
}

