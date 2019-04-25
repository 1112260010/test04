package cn.spring.day16.dao;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class StockDaoImpl extends JdbcDaoSupport implements StockDao {
    @Override
    public int updateStock(Integer sid, Integer scount, Boolean isBuy) {
        String sql = "";
        if(isBuy){        //买入股票，股票增多
            sql = "update stock set scount = scount + ? where sid = ?";
        }else{          //卖出股票，股票减少
            sql = "update stock set scount = scount - ? where sid = ?";
        }
        int count = this.getJdbcTemplate().update(sql, scount, sid);
        return count;
    }
}
