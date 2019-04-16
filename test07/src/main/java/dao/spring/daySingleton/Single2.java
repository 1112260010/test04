package dao.spring.daySingleton;

public class Single2 {
    private static Single2 single = new Single2();

    private Single2(){

    }

    public static Single2 getInstance(){
        return single;
    }
}
