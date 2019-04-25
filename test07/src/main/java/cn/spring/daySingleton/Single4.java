package cn.spring.daySingleton;

public class Single4 {
    private static class Singleton{
        private static final Single4 INSTANCE = new Single4();
    }

    private Single4(){

    }

    public static Single4 getInstance(){
        return Singleton.INSTANCE;
    }
}
