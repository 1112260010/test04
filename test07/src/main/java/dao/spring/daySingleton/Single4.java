package dao.spring.daySingleton;

import com.sun.org.apache.xml.internal.dtm.ref.DTMDefaultBaseIterators;

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
