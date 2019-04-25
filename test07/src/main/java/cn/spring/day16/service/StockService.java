package cn.spring.day16.service;

public interface StockService {

    public int buyStock(Integer aid,Integer money,Integer sid,Integer scount) throws Exception;

    public int changeAccount(Integer aid,Integer money,Integer sid,Integer scount);

    public void changeStock(Integer sid,Integer scount) throws RuntimeException;
}
