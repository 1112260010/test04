package cn.spring.day04BeforeAndAfter.dao.impl;

import cn.spring.day04BeforeAndAfter.User;
import cn.spring.day04BeforeAndAfter.dao.UserDao;

public class UserDaoImpl implements UserDao {
    @Override
    public void saveUser(User user) {
        System.out.println("save user ok");
    }
}
