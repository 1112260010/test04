package Dao;

import cn.NewsDao;
import pojo.News;
import pojo.PageParams;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsDaoImpl extends BaseDao implements NewsDao {
    public static String sql;

    public NewsDaoImpl(Connection con){
        super(con);
    }


    @Override
    public List<News> selectNews(Integer size) {
        ResultSet rs = null;
        String sql = "select id,title,content,createTime from easybuy_news order by createTime limit 0,?";
        rs = this.executeQuery(sql,size);
        List list = new ArrayList();
        News news = null;
        try {
            while(rs.next()){
                news = new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setCreateTime(rs.getString("createTime"));
                list.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public PageParams getPage(PageParams pageParams) {
        PageParams pp = null;
        News news = new News();
        pp = this.page(sql,pageParams,news);
        return pp;
    }

    @Override
    public PageParams getAllNews(PageParams pageParams) {
        PageParams pp = null;
        sql = "select id,title,content,createTime from easybuy_news ";
        pp = this.getPage(pageParams);
        return pp;
    }

    @Override
    public PageParams selectNewsByName(PageParams pageParams, String likeName) {
        PageParams pp = null;
        sql = "select id,title,content,createTime from easybuy_news where title like '%"+likeName+"%'";
        pp = this.getPage(pageParams);
        return pp;
    }

    @Override
    public News selectNewsById(Integer id) {
        ResultSet rs = null;
        News news = null;
        String sql = "select id,title,content,createTime from easybuy_news where id = "+id;
        rs = this.executeQuery(sql);
        try {
            while(rs.next()){
                news = new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setCreateTime(rs.getString("createTime"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return news;
    }

    @Override
    public Boolean updateNews(News news) {
        Boolean flag = false;
        String sql = "update easybuy_news set title = ? , content = ? where id = ? ";
        int rows = this.executeUpdate(sql,news.getTitle(),news.getContent(),news.getId());
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public Boolean addNews(News news) {
        Boolean flag = false;
        String sql = "insert into easybuy_news (title,content,createTime) values (?,?,?) ";
        int rows = this.executeUpdate(sql,news.getTitle(),news.getContent(),news.getCreateTime());
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public Boolean deleteNews(Integer id) {
        Boolean flag = false;
        String sql = "delete from easybuy_news where id = "+id;
        int rows = this.executeUpdate(sql);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }
}
