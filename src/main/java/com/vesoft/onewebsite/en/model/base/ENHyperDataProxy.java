package com.vesoft.onewebsite.en.model.base;

import java.util.Date;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.upms.service.EruptUserService;

@Service
public class ENHyperDataProxy implements DataProxy<HyperModel> {
    @Resource
    private EruptUserService eruptUserService;

    public ENHyperDataProxy() {
    }

    public void beforeAdd(HyperModel hyperModel) {
        hyperModel.setCreateTime(new Date());
        hyperModel.setCreateUser(new EruptUserVo(this.eruptUserService.getCurrentUid()));
        hyperModel.setUpdateTime(new Date());
        hyperModel.setUpdateUser(new EruptUserVo(this.eruptUserService.getCurrentUid()));
    }

    public void beforeUpdate(HyperModel hyperModel) {
        hyperModel.setUpdateTime(new Date());
        hyperModel.setUpdateUser(new EruptUserVo(this.eruptUserService.getCurrentUid()));
    }
}
