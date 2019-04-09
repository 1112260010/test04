package Dao;


import cn.UserDao;
import pojo.PageParams;
import pojo.User;
import pojo.UserAddress;
import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户操作
 */
public class UserDaoImpl extends BaseDao implements UserDao {

    public static String sql = null;

    public UserDaoImpl(Connection con){
        super(con);
    }

    /**
     * 登陆
     * @param user
     * @return
     */
    @Override
    public User doLogin(User user){
        ResultSet rs = null;
        User eu = null;
        String sql = "SELECT `id`, `loginName`,`userName`,`password`,`sex`,`identityCode`,`email`,`mobile`,`type` FROM easybuy_user " +
                "WHERE loginName = ? AND `password` = ? ";
        String name = user.getLoginName();
        String pwd = user.getPassword();
        if(pwd != null && !pwd.equals("")){
            pwd = DatabaseUtil.md5Hex(pwd);
        }
        try {
            rs = this.executeQuery(sql,name,pwd);
            while(rs.next()){
                eu = new User();
                eu.setId(rs.getInt("id"));
                eu.setLoginName(rs.getString("loginName"));
                eu.setUserName(rs.getString("userName"));
                eu.setPassword(rs.getString("password"));
                eu.setSex(rs.getInt("sex"));
                eu.setIdentityCode(rs.getString("identityCode"));
                eu.setEmail(rs.getString("email"));
                eu.setMobile(rs.getString("mobile"));
                eu.setType(rs.getInt("type"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return eu;
    }

    @Override
    //是否有相同用户名
    public Boolean selectByName(String name) {
        ResultSet rs = null;
        Boolean flag = false;
        String sql = "SELECT loginName FROM easybuy_user " ;
        try{
            rs = this.executeQuery(sql);
            while(rs.next()){
                String loginName = rs.getString("loginName");
                if(loginName.equals(name)){
                    flag = true;
                    break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 注册
     * @param user
     * @return
     */
    @Override
    public Boolean register(User user) {
        Boolean flag = false;
        String sql = "insert into easybuy_user (`loginName`,`userName`,`password`,`sex`,`identityCode`,`email`,`mobile`,`type`)" +
                "values (?,?,?,?,?,?,?,?)";
        Integer i = 0;
            i = this.executeUpdate(sql, user.getLoginName(), user.getUserName(), DatabaseUtil.md5Hex(user.getPassword()), user.getSex(),
                    user.getIdentityCode(), user.getEmail(), user.getMobile(), user.getType());
            if (i > 0) {
                flag = true;
            }

        return flag;
    }

    /**
     * 查找用户所有收货地址
     * @param userId
     * @return
     */
    @Override
    public List<UserAddress> selectByUserId(Integer userId) {
        ResultSet rs = null;
        List<UserAddress> list = null;
        String sql = "SELECT id,address,createTime,isDefault,remark FROM easybuy_user_address "+
                "WHERE userid = ? ";
        rs = this.executeQuery(sql,userId);
        UserAddress userAddress = null;
        if(rs != null) {
            try {
                list = new ArrayList<>();
                while (rs.next()) {
                    userAddress = new UserAddress();
                    userAddress.setId(rs.getInt("id"));
                    userAddress.setAddress(rs.getString("address"));
                    userAddress.setCreateTime(rs.getDate("createTime"));
                    userAddress.setIsDefault(rs.getInt("isDefault"));
                    userAddress.setRemark(rs.getString("remark"));
                    list.add(userAddress);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    /**
     * 添加用户收货地址
     * @param userAddress
     * @return
     */
    @Override
    public Boolean addAddress(UserAddress userAddress) {
        Boolean flag = false;
        String sql = "insert into easybuy_user_address (userId,address,createTime,isDefault,remark) values (?,?,NOW(),?,?) ";
        int rows = this.executeUpdate(sql,userAddress.getUserId(),userAddress.getAddress(),userAddress.getIsDefault(),userAddress.getRemark());
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    /**
     * 根据id查询用户地址
     * @param id
     * @return
     */
    @Override
    public UserAddress selectById(Integer id) {
        ResultSet rs = null;
        UserAddress userAddress = null;
        String sql = "select id,userId,address,createTime,isDefault,remark from easybuy_user_address where id = ? ";
        rs = this.executeQuery(sql,id);
        try {
            while(rs.next()){
                userAddress = new UserAddress();
                userAddress.setId(rs.getInt("id"));
                userAddress.setUserId(rs.getInt("userId"));
                userAddress.setAddress(rs.getString("address"));
                userAddress.setCreateTime(rs.getDate("createTime"));
                userAddress.setIsDefault(rs.getInt("isDefault"));
                userAddress.setRemark(rs.getString("remark"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userAddress;
    }

    @Override
    public Boolean updateAddress(UserAddress userAddress) {
        Boolean flag = false;
        String sql = "update easybuy_user_address set address = ? , remark = ? where id = ? ";
        int rows = this.executeUpdate(sql, userAddress.getAddress(),userAddress.getRemark(),userAddress.getId());
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public Boolean updateIsDefault1(Integer id) {
        Boolean flag = false;
        String sql = "update easybuy_user_address set isDefault = 1 where id = ? ";
        int rows = this.executeUpdate(sql,id);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public Boolean updateIsDefault2(Integer userId) {
        Boolean flag = false;
        String sql = "update easybuy_user_address set isDefault = 0 where userId = ? ";
        int rows = this.executeUpdate(sql,userId);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public Boolean deleteById(Integer id) {
        Boolean flag = false;
        String sql = "delete from easybuy_user_address where id = ? ";
        int rows = this.executeUpdate(sql,id);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public PageParams getPage(PageParams pageParams) {
        User user = new User();
        PageParams pp = this.page(sql,pageParams,user);
        return pp;
    }

    @Override
    public PageParams selectAdminByName(Integer type,String likeName, PageParams pageParams) {
        PageParams pp = null;
        sql = "SELECT `id`, `loginName`,`userName`,`password`,`sex`,`identityCode`,`email`,`mobile`,`type` FROM easybuy_user " +
                " where loginName like '%"+likeName+"%' and type = "+type;
        pp = this.getPage(pageParams);
        return pp;
    }

    @Override
    public PageParams selectAdmin(Integer type, PageParams pageParams) {
        PageParams pp = null;
        sql = "SELECT `id`, `loginName`,`userName`,`password`,`sex`,`identityCode`,`email`,`mobile`,`type` FROM easybuy_user where type = "+type;
        pp = this.getPage(pageParams);
        return pp;
    }

    @Override
    public User selectAdminById(Integer id) {
        ResultSet rs = null;
        User user = null;
        String sql = "select id,loginName,userName from easybuy_user where id = ? ";
        rs = this.executeQuery(sql,id);
        try {
            while(rs.next()){
                user = new User();
                user.setId(rs.getInt("id"));
                user.setLoginName(rs.getString("loginName"));
                user.setUserName(rs.getString("userName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public Boolean deleteAdmin(Integer id) {
        Boolean flag = false;
        String sql = "delete from easybuy_user where id = ? ";
        int rows = this.executeUpdate(sql,id);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public Boolean updateAdmin(Integer id, String userName) {
        Boolean flag = false;
        String sql = "update easybuy_user set userName = ? where id = ? ";
        int rows = this.executeUpdate(sql,userName,id);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public User selectUserById(Integer id) {
        ResultSet rs = null;
        User user = null;
        String sql = "select id,loginName,userName,`password`,`sex`,`identityCode`,`email`,`mobile`,`type` FROM easybuy_user where id = "+id;
        rs = this.executeQuery(sql);
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

}
