package com.vesoft.onewebsite.model.yueshu.products;

import xyz.erupt.upms.model.base.HyperModel;
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
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.annotation.sub_field.sub_edit.TagsType;
import xyz.erupt.core.annotation.EruptDataSource;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Erupt(name = "Website Product Version Compare",
        power = @Power(importable = true, export = true),
        linkTree = @LinkTree(field = "product_category")
)
@Entity
@Table(name = "yueshu_website_product_version")
@Getter
@Setter
public class VersionCompareYueshu extends HyperModel {

    @EruptField(
            views = @View(title = "Name", type = ViewType.TEXT),
            edit = @Edit(title = "Name", notNull = true, type = EditType.INPUT)
    )
    private String name;

    @EruptField(
            views = @View(title = "Version Info"),
            edit = @Edit(title = "Version Info", notNull = true, type=EditType.TAGS, tagsType = @TagsType(
                    tags={"enterprise", "community", "ent_comming_soon", "com_comming_soon"}
            ), search = @Search)
    )
    private String version;

    @EruptField(
            views = @View(title = "Sort"),
            edit = @Edit(title = "Sort")
    )
    private Integer sort;
}
