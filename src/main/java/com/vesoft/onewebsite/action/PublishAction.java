package com.vesoft.onewebsite.action;

import xyz.erupt.annotation.sub_erupt.Tpl;
import xyz.erupt.tpl.annotation.EruptTpl;
import xyz.erupt.tpl.annotation.TplAction;

import java.util.HashMap;
import java.util.Map;

@EruptTpl(engine = Tpl.Engine.Velocity)
public class PublishAction {
    @TplAction(value = "websitePublish", path = "/tpl/publish.vm")
    public Map<String, String> velocity() {
        Map<String, String> map = new HashMap<>();
        map.put("title", "官网发布");
        map.put("language", "zh_CN");
        return map;
    }
}
