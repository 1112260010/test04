package cn.spring.day16.service;

import cn.spring.day16.dao.AccountDao;
import cn.spring.day16.dao.StockDao;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public class StockServiceImpl implements StockService,ApplicationContextAware {
    private StockDao stockDao;
    private AccountDao accountDao;
    private ApplicationContext applicationContext;
    @Override
    /*@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED,rollbackFor = Exception.class)*/
    public int buyStock(Integer aid, Integer money, Integer sid, Integer scount) throws Exception {
        Boolean isBuy = true;
        int r1 = accountDao.updateAccount(aid,money,isBuy);
        if(1==1) {
            throw new Exception("出错了");
        }
        int r2 = stockDao.updateStock(sid,scount,isBuy);
        if(r1>0 && r2>0){
            return r1+r2;
        }else{
            return -1;
        }
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED,rollbackFor = RuntimeException.class)
    public int changeAccount(Integer aid, Integer money, Integer sid, Integer scount) {
        Boolean isBuy = true;
        int r1 = accountDao.updateAccount(aid,money,isBuy);
        System.out.println(this);
        try {
            StockService stockService = (StockService) applicationContext.getBean("stockService");
            System.out.println(stockService);
            stockService.changeStock(sid, scount);
        }catch(RuntimeException e){
            e.printStackTrace();
        }
        return 1;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void changeStock(Integer sid, Integer scount) throws RuntimeException {
        Boolean isBuy = true;
        stockDao.updateStock(sid,scount,isBuy);
        throw new RuntimeException("出错了");
    }

    public StockDao getStockDao() {
        return stockDao;
    }

    public void setStockDao(StockDao stockDao) {
        this.stockDao = stockDao;
    }

    public AccountDao getAccountDao() {
        return accountDao;
    }

    public void setAccountDao(AccountDao accountDao) {
        this.accountDao = accountDao;
    }

    public ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }
}
