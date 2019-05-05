package cn.controller;

import cn.entity.Workorder;
import cn.service.WorkorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class WorkorderController {
    @Autowired
    private WorkorderService workorderService;

    //添加工单
    @RequestMapping("/addsave")
    public String addWorkorder(Workorder workorder, HttpSession session){
        Integer count = workorderService.addWorkorder(workorder);
        if(count > 0){
            session.setAttribute("str","保存成功");
        }else{
            session.setAttribute("str","保存失败");
        }
        return "/findAllWorkorder";
    }

    //查询所有工单
    @RequestMapping("/findAllWorkorder")
    public String findAllWorkorder(Model model){
        List<Workorder> list = workorderService.findAllWorkorder();
        model.addAttribute("list",list);
        return "/workorderList.jsp";
    }

}
