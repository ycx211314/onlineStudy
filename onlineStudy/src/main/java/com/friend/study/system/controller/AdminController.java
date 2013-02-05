package com.friend.study.system.controller;

import com.friend.study.system.model.Administartor;
import com.friend.study.system.service.IAdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-1-31
 * Time: 下午3:55
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "/_control/**")
public class AdminController {
    @Resource
    private IAdminService service;
    public void setService(IAdminService service) {
        this.service = service;
    }

    public ModelAndView login(String username,String password)throws Exception{
        ModelAndView view = new ModelAndView();
        Administartor admin = this.service.login(username,password);
        return view;
    }
    @RequestMapping(value = "/index")
    public ModelAndView index()throws Exception{
        ModelAndView view = new ModelAndView();
        //读取管理员信息
        view.setViewName("_admin/index");
        return view;
    }
}
