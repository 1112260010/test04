package cn.spring.day16.dao;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class AccountDaoImpl extends JdbcDaoSupport implements AccountDao{
    @Override
    public int updateAccount(Integer aid, Integer money, Boolean isBuy) {
        String sql = "";
        if(isBuy){       //买入股票，金额减少
            sql = "update account set abalance = abalance - ? where aid = ?";
        }else{         //卖出股票，金额增多
            sql = "update account set abalance = abalance + ? where aid = ?";
        }
        int count = this.getJdbcTemplate().update(sql, money, aid);
        return count;
    }
}
