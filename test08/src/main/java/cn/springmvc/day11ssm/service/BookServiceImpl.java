package cn.springmvc.day11ssm.service;

import cn.springmvc.day11ssm.dao.BookMapper;
import cn.springmvc.day11ssm.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl implements BookService{
    @Autowired
    private BookMapper bookMapper;
    @Override
    public int addBook(Book book) {
        return bookMapper.insert(book);
    }
}
