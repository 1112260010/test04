package dao.spring.day10ProxyFactoryBean;

import org.springframework.aop.ThrowsAdvice;

public class MyThrowAdvice implements ThrowsAdvice {

    public void afterThrowing(Exception ex){
        System.out.println("=========出错了");
    }
}
