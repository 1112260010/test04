package dao.spring.day10ProxyFactoryBean;

public class Hello {

    public void doHello() throws Exception {
        System.out.println("hello");
        throw new Exception("有异常");
    }
}
