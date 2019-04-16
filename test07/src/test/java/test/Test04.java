package test;

import dao.spring.day04BeforeAndAfter.User;
import dao.spring.day04BeforeAndAfter.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test04 {
    @Test
    public void testBeforeAndAfter(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-04.xml");
        UserService userService = ctx.getBean("userService", UserService.class);
        userService.saveUser(new User());
    }
}
