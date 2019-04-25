package test;

import cn.spring.day11advisor.Hello;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test11 {
    @Test
    public void test01(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day11.xml");
        Hello proxyService = (Hello) ctx.getBean("proxyService");
        proxyService.doHello1();
        proxyService.doHello2();
        proxyService.doHello3();
    }
}
