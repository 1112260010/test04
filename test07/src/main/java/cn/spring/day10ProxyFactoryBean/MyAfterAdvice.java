package cn.spring.day10ProxyFactoryBean;

import org.springframework.aop.AfterReturningAdvice;

import java.lang.reflect.Method;
//后置增强
public class MyAfterAdvice implements AfterReturningAdvice{

    @Override
    public void afterReturning(Object o, Method method, Object[] objects, Object o1) throws Throwable {
        System.out.println("后置增强");
    }
}
