package cn;

import pojo.Product;

import java.util.List;
import java.util.Map;

public interface BuyCarMemcached {

    public Map<String,List<Product>> addProduct(String loginName,Integer id,Integer num);    //购物车添加商品

    public Map<String,List<Product>> getProduct(String loginName);          //获取购物车所有商品

    public Map<String,List<Product>> reduce(String loginName,Integer id);        //购物车根据id删除一个商品

    public Map<String,List<Product>> delete(String loginName,Integer id);     //购物车根据id删除所有该id商品

    public String deleteAll(String loginName);      //清空购物车

    public List<Product> doCollect(String userId,Integer productId);       //收藏商品

    public List<Product> getCollect(String userId);           //根据用户id获取所有收藏商品

    public List<Product> deleteCollect(String userId,Integer productId);        //删除一个收藏商品
}
