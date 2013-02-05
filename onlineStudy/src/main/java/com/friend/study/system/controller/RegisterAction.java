package com.friend.study.system.controller;

import com.friend.base.util.SessionKey;
import com.friend.study.system.model.UserInfo;
import com.friend.study.system.service.IRegistService;
import com.friend.study.system.service.impl.RegistServiceImpl;
import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        boolean flag = this.service.regist(bean);
        mv.setViewName("pages/usercenter/index");
        return mv;
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String username,String password,String code,HttpSession session)throws Exception{
        UserInfo loginer = this.service.login(username,password);
        session.setAttribute(SessionKey.USER,loginer);
        return "redirect:index.jsp";
    }
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session)throws Exception{
        session.removeAttribute(SessionKey.USER);
        return "redirect:index.jsp";
    }

    /**
     * 判断用户名是否存在
     * @param email      email
     * @param  userName        用户名
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/check",produces = "application/json")
    public @ResponseBody Boolean check(String email,String userName)throws Exception{
       boolean flag = false;

        if(email != null && email.length() > 0 ){
            flag = this.service.isExsit(email,1);
        }else if(userName != null && userName.length() > 0){
            flag = this.service.isExsit(userName,2);
        }
        return !flag;
    }

}

