package cn.spring.day08Bean;

public class HelloService implements Hello{

    @Override
    public String doHello() {
        System.out.println("hello");
        return "hello1";
    }
}
