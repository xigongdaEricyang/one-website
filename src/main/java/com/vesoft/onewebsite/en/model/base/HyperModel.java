package com.vesoft.onewebsite.en.model.base;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import xyz.erupt.annotation.PreDataProxy;
import xyz.erupt.annotation.config.EruptSmartSkipSerialize;

@MappedSuperclass
@PreDataProxy(ENHyperDataProxy.class)
public class HyperModel extends BaseModel {
    @EruptSmartSkipSerialize
    @Column(name="create_time")
    private Date createTime;
    @EruptSmartSkipSerialize
    @Column(name = "update_time")
    private Date updateTime;
    @ManyToOne
    @EruptSmartSkipSerialize
    private EruptUserVo create_user;
    @ManyToOne
    @EruptSmartSkipSerialize
    private EruptUserVo update_user;

    public HyperModel() {
    }

    public Date getCreateTime() {
        return this.createTime;
    }

    public Date getUpdateTime() {
        return this.updateTime;
    }

    public EruptUserVo getCreateUser() {
        return this.create_user;
    }

    public EruptUserVo getUpdateUser() {
        return this.update_user;
    }

    public void setCreateTime(final Date createTime) {
        this.createTime = createTime;
    }

    public void setUpdateTime(final Date updateTime) {
        this.updateTime = updateTime;
    }

    public void setCreateUser(final EruptUserVo createUser) {
        this.create_user = createUser;
    }

    public void setUpdateUser(final EruptUserVo updateUser) {
        this.update_user = updateUser;
    }
}
