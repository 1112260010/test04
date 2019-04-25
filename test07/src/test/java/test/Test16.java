package test;

import cn.spring.day16.service.StockService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test16 {
    @Test
    public void test01(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day16.xml");
        StockService stockService = ctx.getBean("stockService", StockService.class);
        int count = 0;


            count = stockService.changeAccount(1,1000,1,10);


        if(count > 0){
            System.out.println("购买成功");
        }else{
            System.out.println("购买失败");
        }
    }
}
