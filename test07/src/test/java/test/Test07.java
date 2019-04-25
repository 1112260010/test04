package test;

import cn.spring.day07StaticProxy.ProxySubject;
import cn.spring.day07StaticProxy.RealSubject;
import org.junit.Test;

public class Test07 {
    @Test
    public void test01(){
        ProxySubject pro = new ProxySubject();
        RealSubject realSubject = new RealSubject();
        pro.setRealSubject(realSubject);
        pro.print();
    }
}
