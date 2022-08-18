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

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Erupt(name = "Use Case",
        power = @Power(importable = true, export = true)
)
@Entity
@Table(name = "website_usecase")
@Getter
@Setter
public class UseCase extends HyperModel {
    @EruptField(
            views = @View(title = "标题"),
            edit = @Edit(title = "标题", notNull = true, search = @Search(vague = true))
    )
    private String title;

    @EruptField(
            views = @View(title = "描述", type=ViewType.HTML),
            edit = @Edit(title = "描述", type = EditType.HTML_EDITOR, notNull = true)
    )
    @Column(columnDefinition = "LONGTEXT NOT NULL")
    private String description;

    @EruptField(
            views = @View(title = "图片", type = ViewType.IMAGE),
            edit = @Edit(title = "图片", type = EditType.INPUT)
    )
    private String link;
}
