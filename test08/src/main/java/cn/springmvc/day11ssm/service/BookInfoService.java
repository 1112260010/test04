package cn.springmvc.day11ssm.service;

import cn.springmvc.day11ssm.entity.BookInfo;

import java.util.List;

public interface BookInfoService {

    public List<BookInfo> findAll();
}
