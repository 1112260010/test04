package dao.spring.day02Before.service.impl;

import dao.spring.day02Before.User;
import dao.spring.day02Before.dao.UserDao;
import dao.spring.day02Before.service.UserService;

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
