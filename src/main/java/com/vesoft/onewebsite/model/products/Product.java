package com.vesoft.onewebsite.model.products;

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
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.*;
import java.util.Set;

@Erupt(name = "官网产品信息",
        power = @Power(importable = true, export = true),
        linkTree = @LinkTree(field = "product_category")
)
@Entity
@Table(name = "website_product")
@Getter
@Setter
public class Product extends HyperModel {
    @EruptField(
            views = @View(title = "主标题"),
            edit = @Edit(title = "主标题", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @EruptField(
            views = @View(title = "产品描述"),
            edit = @Edit(title = "产品描述", notNull = true, search = @Search(vague = true))
    )
    private String description;

    @EruptField(
            views = @View(title = "主图", type= ViewType.IMAGE),
            edit = @Edit(title = "主图", notNull = true, type = EditType.INPUT)
    )
    private String main_pic;

//    @EruptField(
//        views = @View(title = "产品类型"),
//        edit = @Edit(title = "产品类型", type = EditType.CHOICE,
//        choiceType = @ChoiceType(
//                vl = {
//                    @VL(label = "Nebula Graph", value = "nebulagraph"),
//                    @VL(label = "Explorer", value = "explorer"),
//                    @VL(label = "Dashboard", value = "dashboard"),
//                    @VL(label = "Studio", value = "studio"),
//                    @VL(label = "Cloud", value = "cloud"),
//                }
//        ))
//    )
//    private String type;

    @ManyToOne
    @EruptField(
            views = @View(title = "产品类型", column = "name"),
            edit = @Edit(title = "产品类型", notNull = true, type = EditType.REFERENCE_TREE)
    )
    private ProductCategory product_category;

    @EruptField(
            views = @View(title = "特性概要"),
            edit = @Edit(title = "特性概要", notNull = true, search = @Search(vague = true))
    )
    private String summary;

    @EruptField(
            views = @View(title = "特性概要详情", type=ViewType.TEXT),
            edit = @Edit(title = "特性概要详情", search = @Search(vague = true), type = EditType.TEXTAREA)
    )
    @Column(columnDefinition = "LONGTEXT NOT NULL")
    private String summary_feature;

    @EruptField(
            views = @View(title = "特性概要图片", type=ViewType.IMAGE),
            edit = @Edit(title = "特性概要图片", type = EditType.INPUT)
    )
    private String summary_feature_pic;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name="product_id")
    @EruptField(
            views = @View(title = "添加feature"),
            edit = @Edit(title = "添加feature", search = @Search(vague = true), type = EditType.TAB_TABLE_ADD)
    )
    private Set<Feature> features;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name="product_id")
    @EruptField(
            views = @View(title = "优势"),
            edit = @Edit(title = "优势", search = @Search(vague = true), type = EditType.TAB_TABLE_ADD)
    )
    private Set<Advantage> advantages;

    @EruptField(
            views = @View(title = "使用原因子标题"),
            edit = @Edit(title = "使用原因子标题", notNull = true)
    )
    private String reason_subtitle;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name="product_id")
    @EruptField(
            views = @View(title = "使用原因"),
            edit = @Edit(title = "使用原因", search = @Search(vague = true), type = EditType.TAB_TABLE_ADD)
    )
    private Set<Reason> reasons;

    @EruptField(
            views = @View(title = "视频url"),
            edit = @Edit(title = "视频url")
    )
    private String video_url;

    @EruptField(
            views= @View(title = "其他信息", type = ViewType.CODE),
            edit = @Edit(title = "其他信息", type = EditType.CODE_EDITOR)
    )
    private String other;

}
