package test;

import dao.spring.daySingleton.Single1;
import dao.spring.daySingleton.Single2;
import dao.spring.daySingleton.Single3;
import dao.spring.daySingleton.Single4;
import org.junit.Test;

public class TestSingleton {
    //枚举类型的单例模式
    @Test
    public void test01(){
        Single1 single1 = Single1.INSTANCE;
        System.out.println(single1.getClass());
        System.out.println(single1.get());
    }

    //恶汉模式
    @Test
    public void test02(){
        Single2 single = Single2.getInstance();
        System.out.println(single);
    }

    //懒汉模式
    @Test
    public void test03(){
        Single3 single = Single3.getInstance();
        System.out.println(single);
    }

    //内部类
    @Test
    public void test04(){
        Single4 single = Single4.getInstance();
        System.out.println(single);
    }
}
