package cn.spring.dayNetwork;

import org.springframework.aop.MethodBeforeAdvice;

import java.lang.reflect.Method;

public class Util implements MethodBeforeAdvice{
    @Override
    public void before(Method method, Object[] objects, Object o) throws Throwable {
        Equip equip = (Equip)objects[0];
        if("指环".equals(equip.getType())){
            System.out.println(equip.getType());
        }
    }
}
