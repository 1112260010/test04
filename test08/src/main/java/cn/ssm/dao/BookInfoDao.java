package cn.ssm.dao;

import cn.ssm.entity.BookInfo;

import java.util.List;

public interface BookInfoDao {

    public List<BookInfo> findAll();
}
