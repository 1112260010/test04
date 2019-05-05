package cn.ssm.controller;

import cn.ssm.entity.BookInfo;
import cn.ssm.service.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BookInfoController {
    @Autowired
    private BookInfoService bookInfoService;

    @RequestMapping("/findAll")
    @ResponseBody
    public List<BookInfo> findAll(){
        List<BookInfo> list = bookInfoService.findAll();
        return list;
    }
}
