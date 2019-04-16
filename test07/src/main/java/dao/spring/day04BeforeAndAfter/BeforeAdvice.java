package dao.spring.day04BeforeAndAfter;

public class BeforeAdvice {

    public void before(){
        System.out.println("前日志");
    }

    public void after(){
        System.out.println("后日志");
    }
}
