package cn.controller;

import cn.entity.Project;
import cn.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    //查询所有项目
    @RequestMapping("/findAllProject")
    @ResponseBody
    public List<Project> findAllProject(){
        List<Project> list = projectService.findAllProject();
        return list;
    }

    //获取projectId
    @RequestMapping(value = "/projectId")
    public String addWorkor(String pid,Model model){
        model.addAttribute("pid",pid);
        return "/add.jsp";
    }
}
