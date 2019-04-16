package dao.spring.day10ProxyFactoryBean;

import org.springframework.aop.MethodBeforeAdvice;

import java.lang.reflect.Method;
//前置增强
public class MyBeforeAdvice implements MethodBeforeAdvice {
    @Override
    public void before(Method method, Object[] objects, Object o) throws Throwable {
        System.out.println("前置增强");
    }
}
