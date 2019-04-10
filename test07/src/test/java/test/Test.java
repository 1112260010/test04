package test;

import cn.Spring.day01.Printer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
    @org.junit.Test
    public void test01(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        Printer printer = ctx.getBean("printer", Printer.class);
        printer.print();
    }
}
