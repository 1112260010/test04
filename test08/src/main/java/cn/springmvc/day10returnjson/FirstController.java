package cn.springmvc.day10returnjson;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.alibaba.*;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

@Controller
public class FirstController {
    @RequestMapping("/hello")
    public void doFirst(HttpServletResponse response) throws IOException {
        List<User> list = new ArrayList<>();
        User u1 = new User();
        u1.setName("张三");
        u1.setAge(20);
        User u2 = new User();
        u2.setName("李四");
        u2.setAge(30);
        list.add(u1);
        list.add(u2);
        String data = JSON.toJSONString(list);
        response.getWriter().write(data);
    }

    @RequestMapping("/second")
    @ResponseBody
    public Object doSecond() throws IOException {
        List<User> list = new ArrayList<>();
        User u1 = new User();
        u1.setName("张三");
        u1.setAge(20);
        User u2 = new User();
        u2.setName("李四");
        u2.setAge(30);
        list.add(u1);
        list.add(u2);
        return list;
    }
}
