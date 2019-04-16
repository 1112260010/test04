package test;

import dao.spring.dayNetwork.Equip;
import dao.spring.dayNetwork.Player;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestNetwork {
    @Test
    public void test01(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-network.xml");
        Player player = ctx.getBean("player", Player.class);
        Equip equip = ctx.getBean("ring2",Equip.class);
        player.pint(equip);
    }

    @Test
    public void test02(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-network.xml");
        Equip equip = ctx.getBean("ring", Equip.class);
        System.out.println(equip);
    }
}
