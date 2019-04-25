package test;

import cn.spring.day05AnnotationSpring.Book;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test05 {
    @Test
    public void test01(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day05.xml");
        Book book = ctx.getBean("book", Book.class);
        System.out.println(book.getId());
        System.out.println(book.getName());
        System.out.println(book.getType().getName());
    }
}
