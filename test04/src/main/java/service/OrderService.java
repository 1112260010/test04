package service;

import pojo.Order;
import pojo.OrderDetail;
import pojo.PageParams;

import java.util.List;

public interface OrderService {

    public Boolean addOrder(Order order);

    public Integer selectByUserId(Integer userId);

    public Boolean addOrderDetail(Order order);

    public Boolean deleteOrder(Integer userId);

    public List<Order> selectOrderByUserId(Integer userId);

    //后台

    public PageParams getAllOrder(PageParams pageParams);

    public PageParams getOrderByLikeName(PageParams pageParams,String likeName);

    public Boolean deleteOrderById(Integer id);

}
