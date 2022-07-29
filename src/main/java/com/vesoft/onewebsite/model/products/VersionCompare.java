package com.vesoft.onewebsite.model.products;

import com.vesoft.onewebsite.model.partner.PartnerCategory;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Check;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.LinkTree;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.ViewType;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Erupt(name = "官网产品版本功能对比",
        power = @Power(importable = true, export = true),
        linkTree = @LinkTree(field = "product_category")
)
@Entity
@Table(name = "website_product_version")
@Getter
@Setter
public class VersionCompare extends HyperModel {
    @EruptField(
            views = @View(title = "功能类型"),
            edit = @Edit(title = "功能类型", search = @Search(vague = true))
    )
    private String function_type;

//    @EruptField(
//            views = @View(title = "产品类型"),
//            edit = @Edit(title = "产品类型", type = EditType.CHOICE,
//                    choiceType = @ChoiceType(
//                            vl = {
//                                    @VL(label = "Nebula Graph", value = "nebulagraph"),
//                                    @VL(label = "Explorer", value = "explorer"),
//                                    @VL(label = "Dashboard", value = "dashboard"),
//                                    @VL(label = "Studio", value = "studio"),
//                                    @VL(label = "Cloud", value = "cloud"),
//                            }
//                    ), search = @Search(vague = true))
//
//    )
//    private String product_type;

    @ManyToOne
    @EruptField(
            views = @View(title = "产品类型", column = "name"),
            edit = @Edit(title = "产品类型", notNull = true, type = EditType.REFERENCE_TREE)
    )
    private ProductCategory product_category;


    @EruptField(
            views = @View(title = "功能名称", type = ViewType.TEXT),
            edit = @Edit(title = "功能名称", notNull = true, type = EditType.INPUT)
    )
    private String name;

    @EruptField(
            views = @View(title = "版本情况"),
            edit = @Edit(title = "版本情况", notNull = true, type=EditType.TAGS, tagsType = @TagsType(
                    tags={"enterprise", "community", "ent_comming_soon", "com_comming_soon"}
            ), search = @Search)
    )
    private String version;
}
