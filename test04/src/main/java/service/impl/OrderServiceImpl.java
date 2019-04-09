package service.impl;

import cn.BuyCarMemcached;
import cn.OrderDao;
import Dao.BuyCarMemcachedImpl;
import Dao.OrderDaoImpl;
import pojo.Order;
import pojo.OrderDetail;
import pojo.PageParams;
import pojo.Product;
import service.OrderService;
import service.ProductCategoryService;
import util.DatabaseUtil;

import java.sql.Connection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class OrderServiceImpl implements OrderService {
    BuyCarMemcached buyCarMemcached = new BuyCarMemcachedImpl();
    ProductCategoryService productCategoryService = new ProductCategoryServiceImpl();

    @Override
    public Boolean addOrder(Order order) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new OrderDaoImpl(con).addOrder(order);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Integer selectByUserId(Integer userId) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new OrderDaoImpl(con).selectByUserId(userId);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean addOrderDetail(Order order) {
        Connection con = null;
        OrderDao orderDao = null;
        try {
            con = DatabaseUtil.getConnection();
            orderDao = new OrderDaoImpl(con);
            OrderDetail orderDetail = null;
            Integer orderId = this.selectByUserId(order.getUserId());        //获取订单id
            Map<String, List<Product>> map = buyCarMemcached.getProduct(order.getLoginName());    //获取该订单所有商品
            Integer productId = null;                                      //商品id
            Iterator<Map.Entry<String, List<Product>>> it = map.entrySet().iterator();
            List<Product> list = null;
            Integer quantity = null;          //商品数量
            Integer stock = null;            //商品库存
            Float cost = null;               //商品总金额
            Boolean flag = false;
            Product product = null;         //商品对象
            while (it.hasNext()) {
                orderDetail = new OrderDetail();
                Map.Entry<String, List<Product>> entry = it.next();
                productId = Integer.parseInt(entry.getKey());
                product = productCategoryService.selectById(productId);
                stock = product.getStock();
                orderDetail.setOrderId(orderId);
                orderDetail.setProductId(productId);
                list = entry.getValue();
                quantity = list.size();
                if (quantity > stock) {
                    return false;
                }
                cost = quantity * list.get(0).getPrice();
                orderDetail.setQuantity(quantity);
                orderDetail.setCost(cost);
                flag = orderDao.addOrderDetail(orderDetail);
            }
            if (flag) {
                return true;
            }
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
        return false;
    }

    @Override
    public Boolean deleteOrder(Integer userId) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new OrderDaoImpl(con).deleteOrder(userId);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public List<Order> selectOrderByUserId(Integer userId) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new OrderDaoImpl(con).selectOrderByUserId(userId);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    //后台

    @Override
    public PageParams getAllOrder(PageParams pageParams) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new OrderDaoImpl(con).getAllOrder(pageParams);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public PageParams getOrderByLikeName(PageParams pageParams, String likeName) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new OrderDaoImpl(con).getOrderByLikeName(pageParams,likeName);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean deleteOrderById(Integer id) {
        Connection con = null;
        OrderDao orderDao = null;
        Boolean flag = false;
        try {
            con = DatabaseUtil.getConnection();
            orderDao = new OrderDaoImpl(con);
            if(orderDao.deleteOrderById(id)){
                if(orderDao.deleteOrderDetailById(id)){
                    flag = true;
                }
            }
            return flag;
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

}
