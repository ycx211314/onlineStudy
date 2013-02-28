package com.friend.study.exam.controller;

import com.friend.study.exam.model.Subject;
import com.friend.study.exam.service.IExamService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-21
 * Time: 下午4:12
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "/exam/**")
public class ExamController {
    @Resource
    private IExamService sevice;
    public void setSevice(IExamService sevice) {
        this.sevice = sevice;
    }

    @RequestMapping("/subject/{bid}")
    public ModelAndView findSuject(@PathVariable Integer bid)throws Exception{
        List<Subject> subs = this.sevice.findSubject(0);
        ModelAndView view =new ModelAndView();
        ArrayList<String> choose = new ArrayList<String>();
        choose.add("A");
        choose.add("B");
        choose.add("C");
        choose.add("D");
        choose.add("E");
        view.addObject("subs",subs);
        view.addObject("choose",choose);
        view.setViewName("/pages/practice");
        return view;
    }
}
