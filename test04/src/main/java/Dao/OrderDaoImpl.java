package Dao;

import cn.OrderDao;
import pojo.Order;
import pojo.OrderDetail;
import pojo.PageParams;
import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl extends BaseDao implements OrderDao {
    public static String sql;

    public OrderDaoImpl(Connection con){super(con);}

    @Override
    public Boolean addOrder(Order order) {
        Boolean flag = false;
        String sql = "insert into easybuy_order (userId,loginName,userAddress,createTime,cost,serialNumber)" +
                " values (?,?,?,?,?,?)";
        String serialNumber = DatabaseUtil.md5Hex(order.getSerialNumber());
        int rows = this.executeUpdate(sql,order.getUserId(),order.getLoginName(),order.getUserAddress(),order.getCreateTime(),order.getCost(),serialNumber);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    /**
     * 根据用户id查询用户的最后一个订单
     * @param userId
     * @return
     */
    @Override
    public Integer selectByUserId(Integer userId) {
        ResultSet rs = null;
        Integer id = null;
        String sql = "select id from easybuy_order where userId = ? order by createTime desc limit 1 ";
        rs = this.executeQuery(sql,userId);
        try {
            if(rs.next()){
                id = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    @Override
    public Boolean addOrderDetail(OrderDetail orderDetail) {
        Boolean flag = false;
        String sql = "insert into easybuy_order_detail (orderId,productId,quantity,cost) values (?,?,?,?)";
        int rows = this.executeUpdate(sql,orderDetail.getOrderId(),orderDetail.getProductId(),orderDetail.getQuantity(),orderDetail.getCost());
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public Boolean deleteOrder(Integer userId) {
        Boolean flag = false;
        String sql = "delete from easybuy_order where userId = ? order by createTime desc limit 1 ";
        int rows = this.executeUpdate(sql,userId);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public List<Order> selectOrderByUserId(Integer userId) {
        ResultSet rs = null;
        List<Order> list = new ArrayList<>();
        Order order = null;
        String sql = "select id,userId,loginName,userAddress,createTime,cost,serialNumber from easybuy_order where userId = "+userId;
        rs = this.executeQuery(sql);
        try {
            while(rs.next()){
                order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("userId"));
                order.setLoginName(rs.getString("loginName"));
                order.setUserAddress(rs.getString("userAddress"));
                order.setCreateTime(rs.getDate("createTime"));
                order.setCost(rs.getFloat("cost"));
                order.setSerialNumber(rs.getString("serialNumber"));
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //后台

    @Override
    public PageParams getPage(PageParams pageParams) {
        Order order = new Order();
        PageParams pp = this.page(sql,pageParams,order);
        return pp;
    }

    @Override
    public PageParams getAllOrder(PageParams pageParams) {
        PageParams pp = null;
        sql = "select id,userId,loginName,userAddress,createTime,cost,serialNumber from easybuy_order ";
        pp = this.getPage(pageParams);
        return pp;
    }

    @Override
    public PageParams getOrderByLikeName(PageParams pageParams, String likeName) {
        PageParams pp = null;
        sql = "select id,userId,loginName,userAddress,createTime,cost,serialNumber from easybuy_order where loginName like '%"+likeName+"%' ";
        pp = this.getPage(pageParams);
        return pp;
    }

    @Override
    public Boolean deleteOrderById(Integer id) {
        Boolean flag = false;
        String sql = "delete from easybuy_order where id = "+id;
        int rows = this.executeUpdate(sql);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public Boolean deleteOrderDetailById(Integer id) {
        Boolean flag = false;
        String sql = "delete from easybuy_order_detail where orderId = "+id;
        int rows = this.executeUpdate(sql);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }


}
