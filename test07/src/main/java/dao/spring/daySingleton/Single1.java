package dao.spring.daySingleton;

public enum Single1 {
    INSTANCE;

    public String get(){
        return "instance";
    }
}
