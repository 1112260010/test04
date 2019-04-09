package cn;

import pojo.News;
import pojo.PageParams;

import java.util.List;

public interface NewsDao {

    public List<News> selectNews(Integer size);

    //后台

    public PageParams getPage(PageParams pageParams);

    public PageParams getAllNews(PageParams pageParams);

    public PageParams selectNewsByName(PageParams pageParams,String likeName);

    public News selectNewsById(Integer id);

    public Boolean updateNews(News news);

    public Boolean addNews(News news);

    public Boolean deleteNews(Integer id);
}
