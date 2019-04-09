package util;

import cn.ProductCategoryDao;
import cn.UserDao;
import Dao.ProductCategoryDaoImpl;
import Dao.UserDaoImpl;
import org.apache.commons.codec.digest.DigestUtils;
import pojo.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 连接数据库
 */
public class DatabaseUtil {
    private static String driver = (String)ConfigManager.getConfigManager().getValue("driver");// 数据库驱动字符串
    private static String url = (String)ConfigManager.getConfigManager().getValue("url");// 连接URL字符串
    private static String user = (String)ConfigManager.getConfigManager().getValue("user"); // 数据库用户名
    private static String password = (String)ConfigManager.getConfigManager().getValue("password"); // 用户密码
    public static ProductCategoryDao productCategoryDao = new ProductCategoryDaoImpl(DatabaseUtil.getConnection());
    public static UserDao userDao = new UserDaoImpl(DatabaseUtil.getConnection());
    /*public static BaseDao baseDao = new BaseDao();*/
    /*private static String driver = "com.mysql.jdbc.Driver";// 数据库驱动字符串
    private static String url = "jdbc:mysql://localhost:3306/easybuy?useUnicode=true&characterEncoding=utf-8";// 连接URL字符串
    private static String user = "root"; // 数据库用户名
    private static String password = "1234";*/

    /*static{
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }*/

    /**
     * 连接数据库
     * @return
     * @throws SQLException
     */
    public static Connection getConnection(){

        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url,user,password);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;
    }

    /**
     * 释放流资源
     * @param con
     * @param ps
     * @param rs
     */
    public static void destroy(Connection con, PreparedStatement ps, ResultSet rs){
        //若结果集对象不为空，则关闭
        try {
            if(rs != null && !rs.isClosed()){
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //若PreparedStatement对象不为空，则关闭
        try {
            if(ps != null && !ps.isClosed()){
                ps.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //若数据库连接对象不为空，则关闭
        try {
            if(con != null && !con.isClosed()){
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * md5加密
     * @param str
     * @return
     */
    public static String md5Hex(String str){
        return DigestUtils.md5Hex(str);
    }

    /**
     * 获得订单号
     * @param machineId
     * @return
     */
    public static String genId(String machineId){
        String orderId = machineId + (System.currentTimeMillis() + "").substring(1) + (System.nanoTime() + "").substring(7, 10);
        System.out.println(orderId);
        return orderId;
    }

    /**
     * 处理分页数据
     * @param rs
     * @param obj
     * @return
     */
    public static List<?> handle(ResultSet rs, Object obj) {
        if (rs != null){
            if (obj instanceof User) {
                List<User> list = new ArrayList<>();
                User user = null;
                try {
                    while(rs.next()){
                        user = new User();
                        user.setId(rs.getInt("id"));
                        user.setLoginName(rs.getString("loginName"));
                        user.setUserName(rs.getString("userName"));
                        user.setPassword(rs.getString("password"));
                        user.setSex(rs.getInt("sex"));
                        user.setIdentityCode(rs.getString("identityCode"));
                        user.setEmail(rs.getString("email"));
                        user.setMobile(rs.getString("mobile"));
                        user.setType(rs.getInt("type"));
                        list.add(user);
                    }
                    return list;
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }else if(obj instanceof Product){
                List<Product> list = new ArrayList<>();
                Product product = null;
                ProductCategory productCategory2 = null;
                try {
                    while(rs.next()){
                        product = new Product();
                        product.setId(rs.getInt("id"));
                        product.setName(rs.getString("name"));
                        product.setDescription(rs.getString("description"));
                        product.setPrice(rs.getFloat("price"));
                        product.setStock(rs.getInt("stock"));
                        product.setCategoryLevel1Id(rs.getInt("categoryLevel1Id"));
                        product.setCategoryLevel2Id(rs.getInt("categoryLevel2Id"));
                        product.setCategoryLevel3Id(rs.getInt("categoryLevel3Id"));
                        ResultSet rs2 = productCategoryDao.selectById2(rs.getInt("categoryLevel3Id"));
                        List list2 = new ArrayList();
                        while(rs2.next()){
                            productCategory2 = new ProductCategory();
                            productCategory2.setId(rs2.getInt("id"));
                            productCategory2.setName(rs2.getString("name"));
                            productCategory2.setParentId(rs2.getInt("parentId"));
                            productCategory2.setType(rs2.getInt("type"));
                            productCategory2.setIconClass(rs2.getString("iconClass"));
                            list2.add(productCategory2);
                        }
                        product.setFileName(rs.getString("fileName"));
                        product.setIsDelete(rs.getInt("isDelete"));
                        product.setList(list2);
                        list.add(product);
                        /*if(list2.size()==0){
                            list.remove(product);
                        }*/
                    }
                    return list;
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }else if(obj instanceof ProductCategory){
                List<ProductCategory> list1 = new ArrayList<>();
                try {
                    while(rs.next()) {
                        ProductCategory productCategory1 = new ProductCategory();
                        productCategory1.setId(rs.getInt("id"));
                        productCategory1.setName(rs.getString("name"));
                        /*System.out.println(rs.getString("name"));*/
                        productCategory1.setParentId(rs.getInt("parentId"));
                        List list2 = new ArrayList();
                        ResultSet rs2 = productCategoryDao.selectById2(rs.getInt("parentId"));
                        while (rs2.next()) {
                            ProductCategory productCategory2 = new ProductCategory();
                            productCategory2.setId(rs2.getInt("id"));
                            productCategory2.setName(rs2.getString("name"));
                            productCategory2.setParentId(rs2.getInt("parentId"));
                            productCategory2.setType(rs2.getInt("type"));
                            productCategory2.setIconClass(rs2.getString("iconClass"));
                            list2.add(productCategory2);
                        }
                        productCategory1.setType(rs.getInt("type"));
                        productCategory1.setIconClass(rs.getString("iconClass"));
                        productCategory1.setList(list2);
                        list1.add(productCategory1);
                        /*if(productCategory1.getType() != 1 && list2.size()==0){
                            list1.remove(productCategory1);
                        }*/
                    }
                    return list1;
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }else if(obj instanceof Order){
                List<Order> list = new ArrayList<>();
                Order order = null;
                try {
                    while(rs.next()){
                        order = new Order();
                        order.setId(rs.getInt("id"));
                        order.setUserId(rs.getInt("userId"));
                        List<User> list2 = new ArrayList<>();
                        User user = userDao.selectUserById(rs.getInt("userId"));
                        list2.add(user);
                        order.setLoginName(rs.getString("loginName"));
                        order.setUserAddress(rs.getString("userAddress"));
                        order.setCreateTime(rs.getDate("createTime"));
                        order.setCost(rs.getFloat("cost"));
                        order.setSerialNumber(rs.getString("serialNumber"));
                        order.setList(list2);
                        list.add(order);
                    }
                    return list;
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }else if(obj instanceof News){
                List<News> list = new ArrayList<>();
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
                    return list;
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
        return null;
    }
}
