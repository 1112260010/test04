package test;

import dao.spring.day09Cglibproxy.Hello;
import org.junit.Test;
import org.springframework.cglib.proxy.Enhancer;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

import java.lang.reflect.Method;

public class Test09 {
    //cglib动态代理
    @Test
    public void test01(){
        final Hello hello = new Hello();
        //cglib动态对象
        Enhancer enhancer = new Enhancer();
        //设置superClass 父类对象
        enhancer.setSuperclass(hello.getClass());
        //设置回调函数
        enhancer.setCallback(new MethodInterceptor() {
            /**
             *
             * @param o  目标对象
             * @param method  目标对象的方法
             * @param objects   方法入参
             * @param methodProxy  代理对象的方法
             * @return
             * @throws Throwable
             */
            @Override
            public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
                System.out.println("before");
                Object invoke = methodProxy.invoke(hello, objects);
                System.out.println("after");
                return invoke;
            }
        });
        //创建代理对象
        Hello hello1 = (Hello)enhancer.create();
        hello1.doHello();
    }

    @Test
    public void test02(){
        final Hello hello = new Hello();
        Enhancer enhancer = new Enhancer();
        enhancer.setSuperclass(hello.getClass());
        enhancer.setCallback(new MethodInterceptor() {
            @Override
            public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
                System.out.println("前置增强");
                Object invoke = methodProxy.invoke(hello, objects);
                System.out.println("后置增强");
                System.out.println(invoke);
                return null;
            }
        });
        Hello hello1 = (Hello)enhancer.create();
        hello1.doHello();
    }
}
