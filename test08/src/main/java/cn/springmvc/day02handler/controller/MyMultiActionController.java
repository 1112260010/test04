package cn.springmvc.day02handler.controller;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyMultiActionController extends MultiActionController {
    //在地址栏里输入
    //属性方法名称解析器：用特定的name去代替方法名称
    //默认方法名称解析器：用方法名称去调度特定方法
    public ModelAndView doAdd(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("01");
        mv.addObject("info","欢迎来到add");
        return mv;
    }
}
