package com.vesoft.onewebsite.en.model.base;

import javax.persistence.Entity;
import javax.persistence.Table;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.EruptI18n;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

@Entity
@Table(
        name = "e_upms_user"
)
@Erupt(
        name = "简单用户对象"
)
@EruptI18n
public class EruptUserVo extends BaseModel {
    @EruptField(
            views = {@View(
                    title = "姓名",
                    sortable = true
            )},
            edit = @Edit(
                    title = "姓名",
                    notNull = true,
                    search = @Search(
                            vague = true
                    )
            )
    )
    private String name;

    public EruptUserVo() {
    }

    public EruptUserVo(Long id) {
        this.setId(id);
    }

    public String getName() {
        return this.name;
    }

    public void setName(final String name) {
        this.name = name;
    }
}
