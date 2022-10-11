package com.vesoft.onewebsite.action;

import xyz.erupt.annotation.sub_erupt.Tpl;
import xyz.erupt.tpl.annotation.EruptTpl;
import xyz.erupt.tpl.annotation.TplAction;

import java.util.HashMap;
import java.util.Map;

@EruptTpl(engine = Tpl.Engine.Velocity)
public class BlogAction {
    @TplAction(value = "websiteBlog", path = "/tpl/blog.vm")
    public Map<String, String> velocity() {
        Map<String, String> map = new HashMap<>();
        map.put("title", "官网后台");
        map.put("language", "zh_CN");
        return map;
    }
}
