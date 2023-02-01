package com.vesoft.onewebsite.model;

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

import javax.persistence.Entity;
import javax.persistence.Table;

@Erupt(name = "官网通用字典",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_dictionary")
@Getter
@Setter
public class Dictionary extends HyperModel {
    @EruptField(
            views = @View(title = "Key"),
            edit = @Edit(title = "Key", notNull = true, search = @Search(vague = true))
    )
    private String dict_key;

    @EruptField(
            views = @View(title = "Value", type=ViewType.CODE),
            edit = @Edit(title = "Value", notNull = true, type= EditType.CODE_EDITOR)
    )
    private String dict_value;

    @EruptField(
            views = @View(title = "备注", type=ViewType.TEXT),
            edit = @Edit(title = "备注", type= EditType.TEXTAREA, search = @Search(vague = true))
    )
    private String remark;
}
