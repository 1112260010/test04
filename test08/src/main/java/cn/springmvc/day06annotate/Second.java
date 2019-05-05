package cn.springmvc.day06annotate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//命名空间
@Controller
@RequestMapping("/hr")
public class Second {

    //通配符
    @RequestMapping(value = "/**/dosecond")      //在hr和dosecond之间可以有多级路径或没有
    public String doThird(){
        System.out.println("third");
        return "/day06/third.jsp";
    }
    @RequestMapping(value = "/dosecond")
    public String doFirst(){
        System.out.println("second");
        return "/01.jsp";
    }

    @RequestMapping(value = "/*/doFour")       //在hr和doFour之间必须有一级路径
    public String doSecond(){
        System.out.println("four");
        return "/day06/four.jsp";
    }

    @RequestMapping(value = "/*doFive")        //以doFive结尾
    public String doFive(){
        System.out.println("five");
        return "/01.jsp";
    }

    @RequestMapping(value = "/doSix*")         //以doSix开头
    public String doSix(){
        System.out.println("six");
        return "/day06/six.jsp";
    }
}
