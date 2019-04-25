package cn.spring.day14jdbcTemplate.service;

import cn.spring.day14jdbcTemplate.dao.BookDao;
import cn.spring.day14jdbcTemplate.entity.Book;

import java.util.List;

public class BookServiceImpl implements BookService {

    private BookDao bookDao;
    //查询所有图书
    @Override
    public List<Book> findAllBooks() {
        return bookDao.findAllBooks();
    }

    //添加图书
    @Override
    public int addBook(Book book) {
        return bookDao.addBook(book);
    }

    //修改图书
    @Override
    public int updateBook(Book book) {
        return bookDao.updataBook(book);
    }

    //删除图书
    @Override
    public int deleteBook(Integer bookid) {
        return bookDao.deleteBook(bookid);
    }

    public BookDao getBookDao() {
        return bookDao;
    }

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }
}
