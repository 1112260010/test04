package cn.springmvc.day08autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AutowiredController {
    //返回表单页面
    @RequestMapping("/addUI")
    public String addUI(){
        return "/day08/addUser.jsp";
    }

    //点击提交后返回的页面
    @RequestMapping("/add1")
    public String doAdd1(String uname){
        System.out.println(uname);
        return "/index.jsp";
    }

    @RequestMapping("/add2")
    public String doAdd3(@RequestParam(value="uname",required = false)String name, String upwd){
        System.out.println(name);
        System.out.println(upwd);
        return "/index.jsp";
    }

    //点击提交后返回的页面
    @RequestMapping("/addpojo")
    public String doAdd2(User user){
        System.out.println(user.getUname());
        System.out.println(user.getUpwd());
        System.out.println(user.getAddress().getHomeAddress());
        System.out.println(user.getList().get(0).getHomeAddress());
        System.out.println(user.getList().get(1).getHomeAddress());
        return "/01.jsp";
    }
}
