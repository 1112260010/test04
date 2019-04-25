package test;

import cn.spring.day08Bean.Hello;
import cn.spring.day08Bean.HelloService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class Test08 {
    @Test
    public void test(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day08.xml");
        HelloService hello1 = ctx.getBean("hello", HelloService.class);
        System.out.println(hello1);
        HelloService hello2 = ctx.getBean("hello1", HelloService.class);
        System.out.println(hello2);
    }

    @Test
    public void test01(){
        final Hello hello = new HelloService();
        Hello hello1 = (Hello)Proxy.newProxyInstance(hello.getClass().getClassLoader(), hello.getClass().getInterfaces(), new InvocationHandler() {
            @Override
            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                System.out.println("前置增强");
                Object invoke = method.invoke(hello, args);
                System.out.println("后置增强");
                System.out.println(invoke);
                return invoke;
            }
        });
        hello1.doHello();
    }

    //jdk动态代理
    @Test
    public void test02(){
        final Hello hello = new HelloService();
        //创建代理对象
        Hello hello1 = (Hello) Proxy.newProxyInstance(hello.getClass().getClassLoader(), hello.getClass().getInterfaces(), new InvocationHandler() {
            /**
             *
             * @param proxy  目标对象
             * @param method  目标对象的方法
             * @param args  参数数组
             * @return
             * @throws Throwable
             */
            @Override
            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                System.out.println("动态代理");
                method.invoke(hello);

                return null;
            }
        });
        hello1.doHello();
    }
}
