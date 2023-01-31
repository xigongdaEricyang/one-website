package com.vesoft.onewebsite.model.products;

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
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.*;
import java.util.Set;

@Erupt(name = "官网产品特性",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_function_category")
@Getter
@Setter
public class FunctionCategory extends HyperModel {

    @EruptField(
            views = @View(title = "名称"),
            edit = @Edit(title = "名称", search = @Search(vague = true))
    )
    private String name;

    @EruptField(
            views = @View(title = "Sort"),
            edit = @Edit(title = "Sort")
    )
    private Integer sort;

    @ManyToOne
    @EruptField(
            views = @View(title = "产品类型", column = "name"),
            edit = @Edit(title = "产品类型", notNull = true, type = EditType.REFERENCE_TREE)
    )
    private ProductCategory product_category;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name="function_id")
    @EruptField(
            views = @View(title = "功能列表"),
            edit = @Edit(title = "功能列表", search = @Search(vague = true), type = EditType.TAB_TABLE_ADD)
    )
    private Set<VersionCompare> function_item;

    @EruptField(
            views= @View(title = "其他信息", type = ViewType.CODE),
            edit = @Edit(title = "其他信息", type = EditType.CODE_EDITOR)
    )
    private String other;
}
