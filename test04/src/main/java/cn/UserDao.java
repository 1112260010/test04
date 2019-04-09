package cn;

import pojo.PageParams;
import pojo.User;
import pojo.UserAddress;

import java.util.List;

public interface UserDao {
    public User doLogin(User user);     //登陆

    public Boolean register(User user);      //注册

    public Boolean selectByName(String name);    //查找该登录名是否存在

    public List<UserAddress> selectByUserId(Integer userId);      //根据用户id查询用户默认收货地址

    public Boolean addAddress(UserAddress userAddress);        //添加用户收货地址

    public UserAddress selectById(Integer id);           //根据id查询用户收货地址

    public Boolean updateAddress(UserAddress userAddress);       //根据id修改用户地址

    public Boolean updateIsDefault1(Integer id);             //根据id修改成默认地址

    public Boolean updateIsDefault2(Integer userId);          //根据用户id修改成非默认地址

    public Boolean deleteById(Integer id);               //根据id删除地址

    public User selectUserById(Integer id);

    //后台

    public PageParams selectAdmin(Integer type, PageParams pageParams);         //查找所有管理员

    public User selectAdminById(Integer id);             //根据id查找管理员

    public Boolean deleteAdmin(Integer id);              //根据id删除管理员

    public Boolean updateAdmin(Integer id,String userName);       //根据id修改管理员用户名

    public PageParams getPage(PageParams pageParams);

    public PageParams selectAdminByName(Integer type,String likeName,PageParams pageParams);    //根据名字查找管理员

}
