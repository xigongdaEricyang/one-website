package com.vesoft.onewebsite.model.partner;

import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Tree;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.ViewType;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.Entity;
import javax.persistence.Table;

@Erupt(name = "同路人类型", desc = "同路人分类信息", orderBy = "PartnerCategory.sort")
@Table(name = "website_partner_category")
@Entity
public class PartnerCategory extends HyperModel {

    @EruptField(
            views = @View(title = "类型名称", type= ViewType.TEXT),
            edit = @Edit(title = "类型名称", type = EditType.INPUT, notNull = true)
    )
    private String name;

    @EruptField(
            views = @View(title = "是否显示"),
            edit = @Edit(title = "是否显示", notNull = true)
    )
    private Boolean is_show;

    @EruptField(
            views = @View(title = "顺序"),
            edit = @Edit(title = "顺序")
    )
    private Integer sort;

    @EruptField(
            views = @View(title = "备注"),
            edit = @Edit(title = "备注", type = EditType.TEXTAREA)
    )
    private String remark;
}
