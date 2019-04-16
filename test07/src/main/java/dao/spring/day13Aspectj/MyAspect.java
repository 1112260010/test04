package dao.spring.day13Aspectj;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class MyAspect {
    //前置增强
    @Before(value="execution(* *..*.day13Aspectj.Hello.do*(..))")
    public void MyBefore(){
        System.out.println("前置增强");
    }

    //后置增强
    @AfterReturning(value="execution(* *..*.day13Aspectj.Hello.doHello1(..))")
    public void MyAfterReturning(){
        System.out.println("后置增强");
    }

    @Around(value="execution(* *..*.day13Aspectj.Hello.doHello*(..))")
    public void myAround(ProceedingJoinPoint jp){
        System.out.println("前置========");
        try {
            jp.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        System.out.println("后置=========");
    }
}
