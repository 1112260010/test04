package Dao;

import org.apache.commons.codec.digest.DigestUtils;
import pojo.PageParams;
import util.DatabaseUtil;

import java.sql.*;
import java.util.List;


/**
 * 执行数据库的基础类
 */
public class BaseDao {
    private Connection con = null;


    public BaseDao(Connection con) {
        this.con = con;
    }
    /**
     * 获取数据库连接
     * @return
     */
    /*public Boolean getCon(){
        String driver = (String) ConfigManager.getConfigManager().getValue("driver");// 数据库驱动字符串
        String url = (String)ConfigManager.getConfigManager().getValue("url");// 连接URL字符串
        String user = (String)ConfigManager.getConfigManager().getValue("user"); // 数据库用户名
        String password = (String)ConfigManager.getConfigManager().getValue("password"); // 用户密码
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url,user,password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }*/

    /**
     * 增删改操作
     * @param sql  sql语句
     * @param params  参数数组
     * @return  被影响的行数
     */
    protected int executeUpdate(String sql,Object... params){
        int result = 0;
            PreparedStatement ps = null;
            try {
                ps = con.prepareStatement(sql);
                for (int i = 0; i < params.length; i++) {
                    ps.setObject(i + 1, params[i]);
                }
                result = ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        return result;
    }

    /**
     * 数据库查找
     * @param sql sql语句
     * @param params 参数数组
     * @return 查找到的结果集
     */
    protected ResultSet executeQuery(String sql,Object... params){
        ResultSet rs = null;
            PreparedStatement ps = null;
            try {
                ps = con.prepareStatement(sql);
                for (int i = 0; i < params.length; i++) {
                    ps.setObject(i + 1, params[i]);
                }
                rs = ps.executeQuery();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        return rs;
    }

    /**
     * 释放流资源
     */
    /*public void destroy(ResultSet rs,PreparedStatement ps,Connection con){
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
    }*/

    /**
     * md5加密
     * @param str
     * @return
     */
    public static String md5Hex(String str){
        return DigestUtils.md5Hex(str);
    }



    /**
     * 分页查询
     * @param sql
     * @param pageParams
     * @param params
     * @return
     */
    public PageParams page(String sql,PageParams pageParams,Object obj,Object... params){
        PageParams pp = null;
        Integer totalCount = 0;
        Integer totalPage = 0;
        Integer pageNum = 0;
        Integer pageSize = pageParams.getPageSize();      //每页条数
        Integer pageIndex = pageParams.getPageIndex();     //当前页
        ResultSet rs = null;

        //获取总数量
        String countSql = "select count(*) totalCount from ( "+sql+" ) a";
        rs = this.executeQuery(countSql);
        try {
            while(rs.next()){
                totalCount = rs.getInt("totalCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //获取总页数
        if(totalCount % pageSize == 0){
            totalPage = totalCount / pageSize;
        }else{
            totalPage = totalCount / pageSize + 1;
        }

        //页面页数显示
        if(pageIndex == null){
            pageNum = 1;
        }else if(pageIndex > totalPage){
            pageNum = totalPage;
        }else if(pageIndex < 1){
            pageNum = 1;
        }else{
            pageNum = pageIndex;
        }

        //页面显示
        String pageSql = sql+" limit ?,?";
        rs = this.executeQuery(pageSql,(pageNum-1)*pageSize,pageSize);
        List list = DatabaseUtil.handle(rs,obj);
        pp = new PageParams();
        pp.setList(list);
        pp.setPageSize(pageSize);
        pp.setPageIndex(pageNum);
        pp.setTotalCount(totalCount);
        pp.setTotalPage(totalPage);
        return pp;
    }
}