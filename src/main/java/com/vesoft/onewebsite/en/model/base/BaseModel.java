package com.vesoft.onewebsite.en.model.base;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import org.hibernate.annotations.GenericGenerator;
import xyz.erupt.annotation.EruptField;

@MappedSuperclass
public class BaseModel implements Serializable {
    @Id
    @GeneratedValue(
            generator = "generator"
    )
    @GenericGenerator(
            name = "generator",
            strategy = "native"
    )
    @Column(
            name = "id"
    )
    @EruptField
    private Long id;

    public BaseModel() {
    }

    public Long getId() {
        return this.id;
    }

    public void setId(final Long id) {
        this.id = id;
    }
}
