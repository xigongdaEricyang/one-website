package com.vesoft.onewebsite.action;

import xyz.erupt.annotation.sub_erupt.Tpl;
import xyz.erupt.tpl.annotation.EruptTpl;
import xyz.erupt.tpl.annotation.TplAction;

import java.util.HashMap;
import java.util.Map;

@EruptTpl(engine = Tpl.Engine.Velocity)
public class ENWebsiteAction {
    @TplAction(value = "websiteBlogEN", path = "/tpl/website.vm")
    public Map<String, String> velocity() {
        Map<String, String> map = new HashMap<>();
        map.put("title", "website_platform");
        map.put("language", "en_US");
        return map;
    }
}
