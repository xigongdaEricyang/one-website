package com.vesoft.onewebsite.en.model.products;

import com.vesoft.onewebsite.en.model.base.HyperModel;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.ViewType;
import xyz.erupt.core.annotation.EruptDataSource;

import javax.persistence.Entity;
import javax.persistence.Table;

@EruptDataSource("english_datasource")
@Erupt(name = "产品类型", desc = "产品类型")
@Table(name = "website_product_category")
@Entity
public class ProductCategoryEN extends HyperModel {
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
}
