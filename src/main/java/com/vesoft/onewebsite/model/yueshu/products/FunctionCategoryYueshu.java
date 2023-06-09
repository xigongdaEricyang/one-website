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

import javax.persistence.*;
import java.util.Set;


@Erupt(name = "Function Category",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "yueshu_website_function_category")
@Getter
@Setter
public class FunctionCategoryYueshu extends HyperModel {

    @EruptField(
            views = @View(title = "name"),
            edit = @Edit(title = "name", search = @Search(vague = true))
    )
    private String name;

    @EruptField(
            views = @View(title = "Sort"),
            edit = @Edit(title = "Sort")
    )
    private Integer sort;

    @ManyToOne
    @EruptField(
            views = @View(title = "Product Category", column = "name"),
            edit = @Edit(title = "Product Category", notNull = true, type = EditType.REFERENCE_TREE)
    )
    private ProductCategoryYueshu product_category;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name="function_id")
    @EruptField(
            views = @View(title = "Function List"),
            edit = @Edit(title = "Function List", search = @Search(vague = true), type = EditType.TAB_TABLE_ADD)
    )
    private Set<VersionCompareYueshu> function_item;

    @EruptField(
            views= @View(title = "Other", type = ViewType.CODE),
            edit = @Edit(title = "Other", type = EditType.CODE_EDITOR)
    )
    private String other;
}
