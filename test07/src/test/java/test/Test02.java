package test;

import cn.spring.day03zhuru.constructor.Person;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test02 {
    @Test
    public void testConstrustor(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        Person person = ctx.getBean("person3", Person.class);
        System.out.println(person.getName()+"---"+person.getCar().getBrand()+"----"+person.getCar().getNo());
        /*for(Object item:person.getProperties().keySet()){
            System.out.println(item+"----"+person.getProperties().get(item));
        }*/
    }
}
