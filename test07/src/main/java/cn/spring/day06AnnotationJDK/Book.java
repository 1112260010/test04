package cn.spring.day06AnnotationJDK;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
/*@Repository
@Service
@Controller*/
public class Book {
    @Value("1")
    private Integer id;
    @Value("少儿图书")
    private String name;
    /*@Autowired
    @Qualifier("abc")*/
    @Resource(name="a")
    private Type type;

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
