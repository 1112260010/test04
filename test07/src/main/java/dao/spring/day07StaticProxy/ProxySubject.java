package dao.spring.day07StaticProxy;

public class ProxySubject implements Subject {
    private RealSubject realSubject;
    @Override
    public void print() {
        System.out.println("静态代理");
        realSubject.print();
    }

    public RealSubject getRealSubject() {
        return realSubject;
    }

    public void setRealSubject(RealSubject realSubject) {
        this.realSubject = realSubject;
    }
}
