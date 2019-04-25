package cn.spring.day13Aspectj;

public class Hello {

    public void doHello1()  {
        System.out.println("hello1");

    }

    public void doHello2() throws Exception {
        System.out.println("hello2");
        throw new Exception("报异常了");
    }

    public void doHello3(){
        System.out.println("hello3");
    }
}
