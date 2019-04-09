package service.impl;



import cn.UserDao;
import Dao.UserDaoImpl;
import pojo.PageParams;
import pojo.User;
import pojo.UserAddress;
import service.UserService;
import util.DatabaseUtil;

import java.sql.Connection;
import java.util.List;

public class UserServiceImpl implements UserService {

    @Override
    public User doLogin(User user) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).doLogin(user);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean selectByName(String name) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).selectByName(name);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean register(User user) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).register(user);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public List<UserAddress> selectByUserId(Integer userId) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).selectByUserId(userId);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean addAddress(UserAddress userAddress) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).addAddress(userAddress);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public UserAddress selectById(Integer id) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).selectById(id);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean updateAddress(UserAddress userAddress) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).updateAddress(userAddress);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean updateIsDefault(Integer id,Integer userId) {
        Connection con = null;
        Boolean flag = false;
        UserDao userDao = null;
        try {
            con = DatabaseUtil.getConnection();
            userDao = new UserDaoImpl(con);
            if(userDao.updateIsDefault2(userId)){
                if(userDao.updateIsDefault1(id)){
                    flag = true;
                }
            }
            return flag;
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean deleteById(Integer id) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).deleteById(id);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    //后台

    @Override
    public PageParams selectAdmin(Integer type, PageParams pageParams) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).selectAdmin(type,pageParams);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public User selectAdminById(Integer id) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).selectAdminById(id);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean deleteAdmin(Integer id) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).deleteAdmin(id);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean updateAdmin(Integer id, String userName) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).updateAdmin(id,userName);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public PageParams selectAdminByName(Integer type,String likeName, PageParams pageParams) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).selectAdminByName(type,likeName, pageParams);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public User selectUserById(Integer id) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            return new UserDaoImpl(con).selectUserById(id);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }
}
