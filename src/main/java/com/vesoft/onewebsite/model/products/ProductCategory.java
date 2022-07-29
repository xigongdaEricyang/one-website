package com.vesoft.onewebsite.model.products;

import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.ViewType;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.Entity;
import javax.persistence.Table;

@Erupt(name = "产品类型", desc = "产品类型")
@Table(name = "website_product_category")
@Entity
public class ProductCategory extends HyperModel {
    @EruptField(
            views = @View(title = "产品名称", type= ViewType.TEXT),
            edit = @Edit(title = "产品名称", type = EditType.INPUT, notNull = true)
    )
    private String name;

    @EruptField(
            views = @View(title = "是否显示"),
            edit = @Edit(title = "是否显示", notNull = true)
    )
    private Boolean is_show;

    @EruptField(
            views = @View(title = "备注"),
            edit = @Edit(title = "备注", type = EditType.TEXTAREA)
    )
    private String remark;

    @EruptField(
            views= @View(title = "其他信息", type = ViewType.CODE),
            edit = @Edit(title = "其他信息", type = EditType.CODE_EDITOR)
    )
    private String other;
}
