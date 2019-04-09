package service.impl;

import Dao.NewsDaoImpl;
import pojo.News;
import pojo.PageParams;
import service.NewsService;
import util.DatabaseUtil;

import java.sql.Connection;
import java.util.List;

public class NewsServiceImpl implements NewsService {

    @Override
    public List<News> selectNews(Integer size) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new NewsDaoImpl(con).selectNews(size);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    //后台

    @Override
    public PageParams getAllNews(PageParams pageParams) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new NewsDaoImpl(con).getAllNews(pageParams);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public PageParams selectNewsByName(PageParams pageParams, String likeName) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new NewsDaoImpl(con).selectNewsByName(pageParams, likeName);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public News selectById(Integer id) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new NewsDaoImpl(con).selectNewsById(id);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean updateNews(News news) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new NewsDaoImpl(con).updateNews(news);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean addNews(News news) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new NewsDaoImpl(con).addNews(news);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean deleteNews(Integer id) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new NewsDaoImpl(con).deleteNews(id);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

}
