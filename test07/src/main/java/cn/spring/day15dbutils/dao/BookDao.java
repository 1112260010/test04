package cn.spring.day15dbutils.dao;

import cn.spring.day15dbutils.entity.Book;

import java.util.List;

public interface BookDao {

    public List<Book> findAllBooks();

    public int addBook(Book book);

    public int updataBook(Book book);

    public int deleteBook(Integer bookid);

    public Book findBookByBookid(Integer bookid);
}
