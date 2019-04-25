package cn.spring.day05AnnotationSpring;

import org.springframework.stereotype.Component;

@Component("a")
public class TypeChild extends Type {
    @Override
    public String getName() {
        return "123";
    }
}
