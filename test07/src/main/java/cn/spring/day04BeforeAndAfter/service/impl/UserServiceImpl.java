package cn.spring.day04BeforeAndAfter.service.impl;

import cn.spring.day04BeforeAndAfter.User;
import cn.spring.day04BeforeAndAfter.dao.UserDao;
import cn.spring.day04BeforeAndAfter.service.UserService;

public class UserServiceImpl implements UserService {
    private UserDao userDao;
    @Override
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
