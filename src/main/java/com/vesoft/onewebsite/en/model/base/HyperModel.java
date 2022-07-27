package com.vesoft.onewebsite.en.model.base;

import java.util.Date;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import xyz.erupt.annotation.PreDataProxy;
import xyz.erupt.annotation.config.EruptSmartSkipSerialize;

@MappedSuperclass
@PreDataProxy(ENHyperDataProxy.class)
public class HyperModel extends BaseModel {
    @EruptSmartSkipSerialize
    private Date createTime;
    @EruptSmartSkipSerialize
    private Date updateTime;
    @ManyToOne
    @EruptSmartSkipSerialize
    private EruptUserVo createUser;
    @ManyToOne
    @EruptSmartSkipSerialize
    private EruptUserVo updateUser;

    public HyperModel() {
    }

    public Date getCreateTime() {
        return this.createTime;
    }

    public Date getUpdateTime() {
        return this.updateTime;
    }

    public EruptUserVo getCreateUser() {
        return this.createUser;
    }

    public EruptUserVo getUpdateUser() {
        return this.updateUser;
    }

    public void setCreateTime(final Date createTime) {
        this.createTime = createTime;
    }

    public void setUpdateTime(final Date updateTime) {
        this.updateTime = updateTime;
    }

    public void setCreateUser(final EruptUserVo createUser) {
        this.createUser = createUser;
    }

    public void setUpdateUser(final EruptUserVo updateUser) {
        this.updateUser = updateUser;
    }
}
