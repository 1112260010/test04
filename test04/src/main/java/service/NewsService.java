package service;

import pojo.News;
import pojo.PageParams;

import java.util.List;

public interface NewsService {

    public List<News> selectNews(Integer size);

    //后台

    public PageParams getAllNews(PageParams pageParams);

    public PageParams selectNewsByName(PageParams pageParams,String likeName);

    public News selectById(Integer id);

    public Boolean updateNews(News news);

    public Boolean addNews(News news);

    public Boolean deleteNews(Integer id);
}
