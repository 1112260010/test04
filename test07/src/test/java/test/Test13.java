package test;


import dao.spring.day13Aspectj.Hello;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test13 {
    //Aspectj注解
    @Test
    public void test01(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day13.xml");
        Hello proxyService =  ctx.getBean("hello",Hello.class);
        proxyService.doHello1();
        proxyService.doHello2();
        proxyService.doHello3();
    }

}
