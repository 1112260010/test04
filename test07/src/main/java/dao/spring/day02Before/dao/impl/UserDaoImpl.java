package dao.spring.day02Before.dao.impl;

import dao.spring.day02Before.User;
import dao.spring.day02Before.dao.UserDao;

public class UserDaoImpl implements UserDao{
    @Override
    public void saveUser(User user) {
        System.out.println("save user ok");
    }
}
