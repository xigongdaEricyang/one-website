package com.vesoft.onewebsite.model.partner;

import lombok.Getter;
import lombok.Setter;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.*;
import java.util.Set;

/**
 * 同路人信息
 */
@Erupt(name = "Use Case",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_partner_overview")
@Getter
@Setter
public class PartnerOverview extends HyperModel {
    @EruptField(
            views = @View(title = "标题"),
            edit = @Edit(title = "标题", notNull = true)
    )
    private String title;

    @EruptField(
            views = @View(title = "子标题"),
            edit = @Edit(title = "子标题", notNull = true)
    )
    private String subTitle;

    @EruptField(
            views = @View(title = "同路人描述标题"),
            edit = @Edit(title = "同路人描述标题", notNull = true)
    )
    private String partnerDescTitle;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name="overview_id")
    @EruptField(
            views = @View(title = "同路人项目详情"),
            edit = @Edit(title = "同路人项目详情", type = EditType.TAB_TABLE_ADD)
    )
    private Set<PartnerDesc> partnerDescItems;

}
