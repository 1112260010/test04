package service;

import pojo.PageParams;
import pojo.ProductCategory;
import pojo.User;
import pojo.UserAddress;

import java.util.List;

public interface UserService {

    public User doLogin(User user);    //用户登录

    public Boolean selectByName(String name);      //根据用户名查找用户是否存在

    public Boolean register(User user);       //用户注册

    public List<UserAddress> selectByUserId(Integer userId);       //根据用户id查找用户所有收货地址

    public Boolean addAddress(UserAddress userAddress);      //添加用户地址

    public UserAddress selectById(Integer id);          //根据id查询用户地址

    public Boolean updateAddress(UserAddress userAddress);          //修改用户地址

    public Boolean updateIsDefault(Integer id,Integer userId);           //根据id修改成默认地址

    public Boolean deleteById(Integer id);               //根据id删除地址

    //后台

    public PageParams selectAdmin(Integer type, PageParams pageParams);        //查询所有管理员

    public User selectAdminById(Integer id);           //根据id查询管理员用户

    public Boolean deleteAdmin(Integer id);           //根据id删除管理员

    public Boolean updateAdmin(Integer id, String userName);       //根据id修改管理员用户名

    public PageParams selectAdminByName(Integer type,String likeName,PageParams pageParams);     //根据名字查找管理员

    public User selectUserById(Integer id);



}
