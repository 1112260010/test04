package test;


import dao.spring.day12autoProxy.Hello;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test12 {
    //默认自动代理生成器
    @Test
    public void test01(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day12.xml");
        Hello proxyService =  ctx.getBean("hello",Hello.class);
        proxyService.doHello1();
        proxyService.doHello2();
        proxyService.doHello3();
    }

    //beanName自动代理生成器
    @Test
    public void test02(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day12.xml");
        Hello proxyService = (Hello) ctx.getBean("hello");
        System.out.println(Hello.class);
        proxyService.doHello1();
        proxyService.doHello2();
        proxyService.doHello3();
    }
}
