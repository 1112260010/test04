package cn;

import pojo.Order;
import pojo.OrderDetail;
import pojo.PageParams;

import java.util.List;

public interface OrderDao {

    public Boolean addOrder(Order order);      //添加订单

    public Integer selectByUserId(Integer userId);    //根据用户id查询最后一个订单

    public Boolean addOrderDetail(OrderDetail orderDetail);   //添加订单列表

    public Boolean deleteOrder(Integer userId);        //根据用户id删除订单

    public List<Order> selectOrderByUserId(Integer userId);         //根据用户id查询该用户所有订单

    //后台

    public PageParams getPage(PageParams pageParams);

    public PageParams getAllOrder(PageParams pageParams);     //获取所有用户的订单

    public PageParams getOrderByLikeName(PageParams pageParams,String likeName);     //根据名字查找订单

    public Boolean deleteOrderById(Integer id);          //根据id删除订单

    public Boolean deleteOrderDetailById(Integer id);       //根据订单id删除订单列表
}
