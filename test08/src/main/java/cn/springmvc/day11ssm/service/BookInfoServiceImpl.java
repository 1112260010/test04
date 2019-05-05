package cn.springmvc.day11ssm.service;

import cn.springmvc.day11ssm.dao.BookInfoMapper;
import cn.springmvc.day11ssm.entity.BookInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BookInfoServiceImpl implements BookInfoService {
    @Autowired
    private BookInfoMapper bookInfoMapper;
    @Override
    public List<BookInfo> findAll() {
        return bookInfoMapper.findAll();
    }
}
