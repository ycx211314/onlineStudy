package com.friend.study.system.controller;

import com.friend.study.system.model.Menus;
import com.friend.study.system.service.IMenuService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-4
 * Time: 上午11:07
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "/_control/**")
public class MenuController {
    @Resource
    private IMenuService service;
    public void setService(IMenuService service) {
        this.service = service;
    }
    @RequestMapping(value = "/addMenu",method = RequestMethod.POST)
    public @ResponseBody boolean addMenu(Menus vo,Integer pid) throws Exception {
        boolean flag = true;
        flag = this.service.addMenu(vo);
        return flag;
    }
    @RequestMapping(value = "/delMenu",method = RequestMethod.POST)
    public @ResponseBody boolean delMenu(Integer mid)throws Exception{
        return this.service.remove(mid);
    }

    public @ResponseBody boolean editMenu(Menus vo)throws Exception{
//        return this.service.updateMenu(vo);
        return true;
    }
    @RequestMapping("/menulist")
    public @ResponseBody List<Menus> listMenus()throws Exception{
        return this.service.findAll();
    }
}
