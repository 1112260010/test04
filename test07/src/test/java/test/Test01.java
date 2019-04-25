package test;

import cn.spring.day01.Printer;
import cn.spring.day02Before.User;
import cn.spring.day02Before.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.junit.Test;

public class Test01 {
    @Test
    public void test01(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        Printer printer = ctx.getBean("printer", Printer.class);
        printer.print();
    }

    @Test
    public void test02(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userService = ctx.getBean("userService", UserService.class);
        userService.saveUser(new User());
}
}
