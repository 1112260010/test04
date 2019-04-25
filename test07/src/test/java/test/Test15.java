package test;

import cn.spring.day15dbutils.entity.Book;
import cn.spring.day15dbutils.service.BookService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class Test15 {
    //查询所有图书
    @Test
    public void test01(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day15.xml");
        BookService bookService = ctx.getBean("bookService", BookService.class);
        List<Book> allBooks = bookService.findAllBooks();
        for(Book item:allBooks){
            System.out.println(item.getBookname());
        }
    }

    //添加图书
    @Test
    public void test02(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day15.xml");
        BookService bookService = ctx.getBean("bookService", BookService.class);
        Book book = new Book();
        book.setBookid(6);
        book.setBookname("小红帽");
        book.setBookprice(60);
        int i = bookService.addBook(book);
        System.out.println(i);
    }

    //修改图书
    @Test
    public void test03(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day15.xml");
        BookService bookService = ctx.getBean("bookService", BookService.class);
        Book book = new Book();
        book.setBookid(6);
        book.setBookname("白雪公主");
        int i = bookService.updateBook(book);
        System.out.println(i);
    }

    //删除图书
    @Test
    public void test04(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day15.xml");
        BookService bookService = ctx.getBean("bookService", BookService.class);
        int i = bookService.deleteBook(6);
        System.out.println(i);
    }

    //根据id查询图书
    @Test
    public void test05(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day15.xml");
        BookService bookService = ctx.getBean("bookService", BookService.class);
        Book book = bookService.findBookByBookid(5);
        System.out.println(book.getBookname());
    }
}
