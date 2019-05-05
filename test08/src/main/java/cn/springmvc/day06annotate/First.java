package cn.springmvc.day06annotate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class First {
    @RequestMapping(value = "/hello")
    public String doFirst(){
        System.out.println("first");
        return "/day06/first.jsp";
    }
}
