package cn.spring.day15dbutils.service;

import cn.spring.day15dbutils.entity.Book;

import java.util.List;

public interface BookService {

    public List<Book> findAllBooks();

    public int addBook(Book book);

    public int updateBook(Book book);

    public int deleteBook(Integer bookid);

    public Book findBookByBookid(Integer bookid);
}
