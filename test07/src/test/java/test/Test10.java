package test;

import cn.spring.day10ProxyFactoryBean.Hello;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test10 {
    @Test
    public void test01(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day10.xml");
        Hello proxyFactoryBean = (Hello) ctx.getBean("proxyFactoryBean");
        try {
            proxyFactoryBean.doHello();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
