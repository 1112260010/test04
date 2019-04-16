package dao.spring.day10ProxyFactoryBean;


import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

//环绕增强
public class MyArroundAdvice implements MethodInterceptor {

    @Override
    public Object invoke(MethodInvocation methodInvocation) throws Throwable {
        System.out.println("前置增强");
        Object proceed = methodInvocation.proceed();
        System.out.println("后置增强");
        return proceed;
    }
}
