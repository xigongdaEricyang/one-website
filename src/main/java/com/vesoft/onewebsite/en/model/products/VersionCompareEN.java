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
import xyz.erupt.annotation.sub_field.sub_edit.ChoiceType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.annotation.sub_field.sub_edit.TagsType;
import xyz.erupt.annotation.sub_field.sub_edit.VL;
import xyz.erupt.core.annotation.EruptDataSource;

import javax.persistence.Entity;
import javax.persistence.Table;

@EruptDataSource("english_datasource")
@Erupt(name = "官网产品版本功能对比",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_product_version")
@Getter
@Setter
public class VersionCompareEN extends HyperModel {
    @EruptField(
            views = @View(title = "功能类型"),
            edit = @Edit(title = "功能类型", search = @Search(vague = true))
    )
    private String function_type;

    @EruptField(
            views = @View(title = "产品类型"),
            edit = @Edit(title = "产品类型", type = EditType.CHOICE,
                    choiceType = @ChoiceType(
                            vl = {
                                    @VL(label = "Nebula Graph", value = "nebulagraph"),
                                    @VL(label = "Explorer", value = "explorer"),
                                    @VL(label = "Dashboard", value = "dashboard"),
                                    @VL(label = "Studio", value = "studio"),
                                    @VL(label = "Cloud", value = "cloud"),
                            }
                    ), search = @Search(vague = true))

    )
    private String product_type;


    @EruptField(
            views = @View(title = "功能名称", type = ViewType.TEXT),
            edit = @Edit(title = "功能名称", notNull = true, type = EditType.INPUT)
    )
    private String name;

    @EruptField(
            views = @View(title = "版本情况"),
            edit = @Edit(title = "版本情况", notNull = true, type=EditType.TAGS, tagsType = @TagsType(
                    tags={"enterprise", "community"}
            ), search = @Search)
    )
    private String version;
}
