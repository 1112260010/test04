package cn.spring.day14jdbcTemplate.dao;

import cn.spring.day14jdbcTemplate.entity.Book;

import java.util.List;

public interface BookDao {

    public List<Book> findAllBooks();

    public int addBook(Book book);

    public int updataBook(Book book);

    public int deleteBook(Integer bookid);
}
