package dao.spring.day06AnnotationJDK;

import org.springframework.stereotype.Component;

@Component("a")
public class TypeChild extends Type {
    @Override
    public String getName() {
        return "123";
    }
}
