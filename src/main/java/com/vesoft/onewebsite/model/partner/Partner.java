package com.vesoft.onewebsite.model.partner;

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
import xyz.erupt.annotation.sub_field.sub_edit.AttachmentType;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Erupt(name = "官网同路人信息",
        power = @Power(importable = true, export = true),
        linkTree = @LinkTree(field = "partner_category")
)
@Entity()
@Table(name = "website_partner")
@Getter
@Setter
public class Partner extends HyperModel {
    @EruptField(
            views = @View(title = "公司LOGO", type= ViewType.IMAGE),
            edit = @Edit(title = "公司LOGO", type = EditType.INPUT)
    )
    private String logo;

    @EruptField(
            views = @View(title = "简介", type= ViewType.TEXT),
            edit = @Edit(title = "简介", type = EditType.TEXTAREA)
    )
    private String description;

    @ManyToOne
    @EruptField(
            views = @View(title = "分类", column = "name"),
            edit = @Edit(title = "分类", notNull = true, type = EditType.REFERENCE_TREE)
    )
    private PartnerCategory partner_category;

    @EruptField(
            views = @View(title = "文章id", type = ViewType.TEXT),
            edit = @Edit(title = "文章id", type = EditType.INPUT)
    )
    private String blog_id;

    @EruptField(
            views= @View(title = "其他信息", type = ViewType.CODE),
            edit = @Edit(title = "其他信息", type = EditType.CODE_EDITOR)
    )
    private String other;
}
