package com.friend.study.system.controller;

import com.friend.study.system.model.UserInfo;
import com.friend.study.system.service.IRegistService;
import com.friend.study.system.service.impl.RegistServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with 杨成锡
 * User: Prince
 * Date: 13-1-23
 * Time: 下午10:16
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class RegisterAction{
    @Resource
    private IRegistService service;
    public void setService(IRegistService service) {
        this.service = service;
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public ModelAndView regist(UserInfo bean,@RequestParam("validateCode") String code,String protols)throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.addObject("message", "注册成功");
        this.service.regist(bean);
        mv.setViewName("usercenter/index");
        return mv;
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String username,String password,String code)throws Exception{
        UserInfo loginer = this.service.login(username,password);
        loginer.getUserId();
        return "usercenter/index";
    }

}

