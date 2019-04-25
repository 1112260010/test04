package cn.spring.day13Aspectj;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;

@Aspect
public class MyAspect {
    //前置增强
    /*@Before(value="execution(* *..*.day13Aspectj.Hello.do*(..))")
    public void MyBefore(){
        System.out.println("前置增强---注解");
    }

    //后置增强
    @AfterReturning(value="execution(* *..*.day13Aspectj.Hello.doHello1(..))")
    public void MyAfterReturning(){
        System.out.println("后置增强---注解");
    }*/

    @Around(value="execution(* *..*.day13Aspectj.Hello.doHello*(..))")
    public void myAround(ProceedingJoinPoint jp){
        System.out.println("前置========---注解");
        try {
            jp.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        System.out.println("后置=========---注解");
    }

    @AfterThrowing(value="execution(* *..*.day13Aspectj.Hello.doHello*(..))")
    public void myAfterThrowing(){
        System.out.println("异常增强---注解");
    }

    /*@After(value="execution(* *..*.day13Aspectj.Hello.doHello*(..))")
    public void myAfter(){
        System.out.println("最终增强---注解");
    }*/
}
