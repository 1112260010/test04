package dao.spring.day07StaticProxy;

public class RealSubject implements Subject {
    @Override
    public void print() {
        System.out.println("真实类");
    }
}
