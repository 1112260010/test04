package cn.ssm.controller;

import cn.ssm.entity.Book;
import cn.ssm.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping("/addBook")
    public String addBook(Book book){
        int num = bookService.addBook(book);
        if(num > 0){
            return "/ssm/success.jsp";
        }else{
            return "/ssm/addBook.jsp";
        }
    }
}
