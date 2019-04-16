package dao.spring.daySingleton;

public class Single3 {
    private static Single3 single;
    private Single3(){

    }

    public static Single3 getInstance(){
        if(single == null){
            synchronized (Single3.class){
                if(single == null){
                    single = new Single3();
                }
            }
        }
        return single;
    }
}
