package dao.spring.day04BeforeAndAfter.service.impl;

import dao.spring.day04BeforeAndAfter.User;
import dao.spring.day04BeforeAndAfter.dao.UserDao;
import dao.spring.day04BeforeAndAfter.service.UserService;

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
