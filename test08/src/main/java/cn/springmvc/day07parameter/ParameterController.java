package cn.springmvc.day07parameter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class ParameterController {
    //method限定提交方式为get和post
    @RequestMapping(value = "/login",method = {RequestMethod.GET,RequestMethod.POST})
    public String doLogin(HttpSession session){
        session.setAttribute("obj","name");
        return "/day07/login.jsp";
    }

    @RequestMapping("/regist")
    public String doLogin(Model model){
        model.addAttribute("obj","123");
        return "/day07/regist.jsp";
    }
}
