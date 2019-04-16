package dao.spring.day13Aspectj;

import org.aspectj.lang.ProceedingJoinPoint;

public class MyAspect2 {

    public void myBefore(){
        System.out.println("前置增强");
    }

    public void myAfterReturning(){
        System.out.println("后置增强");
    }

    public void myAround(ProceedingJoinPoint joinPoint){
        System.out.println("前置");
        try {
            joinPoint.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        System.out.println("后置");
    }
}
