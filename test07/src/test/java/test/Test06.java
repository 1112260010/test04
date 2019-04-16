package test;

import dao.spring.day06AnnotationJDK.Book;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test06 {
    @Test
    public void test01(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day06.xml");
        Book book = ctx.getBean("book", Book.class);
        System.out.println(book.getId());
        System.out.println(book.getName());
        System.out.println(book.getType().getName());
    }
}
