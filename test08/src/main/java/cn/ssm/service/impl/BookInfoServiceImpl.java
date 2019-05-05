package cn.ssm.service.impl;

import cn.ssm.dao.BookInfoDao;
import cn.ssm.entity.BookInfo;
import cn.ssm.service.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public class BookInfoServiceImpl implements BookInfoService {

    private BookInfoDao bookInfoDao;

    @Override
    public List<BookInfo> findAll() {
        return bookInfoDao.findAll();
    }

    public BookInfoDao getBookInfoDao() {
        return bookInfoDao;
    }

    public void setBookInfoDao(BookInfoDao bookInfoDao) {
        this.bookInfoDao = bookInfoDao;
    }
}
