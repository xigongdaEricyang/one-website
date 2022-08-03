package com.vesoft.onewebsite.en.model.products;

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
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.annotation.sub_field.sub_edit.TagsType;
import xyz.erupt.core.annotation.EruptDataSource;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@EruptDataSource("english_datasource")
@Erupt(name = "Website Product Version Compare",
        power = @Power(importable = true, export = true),
        linkTree = @LinkTree(field = "product_category")
)
@Entity
@Table(name = "website_product_version")
@Getter
@Setter
public class VersionCompareEN extends HyperModel {
    @EruptField(
            views = @View(title = "Function Type"),
            edit = @Edit(title = "Function Type", search = @Search(vague = true))
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
            views = @View(title = "Category", column = "name"),
            edit = @Edit(title = "Category", notNull = true, type = EditType.REFERENCE_TREE)
    )
    private ProductCategoryEN product_category;


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
