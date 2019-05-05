package cn.ssm.service.impl;

import cn.ssm.dao.BookDao;
import cn.ssm.entity.Book;
import cn.ssm.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


public class BookServiceImpl implements BookService {

    private BookDao bookDao;
    @Override
    public int addBook(Book book) {
        return bookDao.addBook(book);
    }

    public BookDao getBookDao() {
        return bookDao;
    }

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }
}
