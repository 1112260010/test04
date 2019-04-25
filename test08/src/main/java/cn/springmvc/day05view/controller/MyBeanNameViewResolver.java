package cn.springmvc.day05view.controller;

import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyBeanNameViewResolver extends MultiActionController {
    //方法返回值与内外部的视图对象的beanid一致
    public String doInner(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        return "inner";
    }

    public String doOuter(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        return "outer";
    }
}
