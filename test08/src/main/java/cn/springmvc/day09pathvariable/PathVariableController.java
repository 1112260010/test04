package cn.springmvc.day09pathvariable;

import org.springframework.stereotype.Controller;
        import org.springframework.web.bind.annotation.PathVariable;
        import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PathVariableController {
    @RequestMapping("/{rname}/path")
    public String path(@PathVariable("rname") String name){
        System.out.println(name);
        return "/01.jsp" ;
    }
}
