package cn.spring.day19freemarker;

import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;
import freemarker.template.Configuration;
import freemarker.template.Template;

public class TestFreemarker {
    public static void main(String[] args) throws Exception {
        String dir="E:\\ziliao\\IntelliJ IDEA 2017.2.7\\test\\test07\\src\\main\\java\\cn\\spring\\day19freemarker";
        Configuration conf = new Configuration();
        //加载模板文件(模板的路径)
        conf.setDirectoryForTemplateLoading(new File(dir));
        // 加载模板
        Template template = conf.getTemplate("/hello.ftl");
        // 定义数据

        Map root = new HashMap();
        root.put("world", "Hello World");
        root.put("freemarker","Hello Freemarker");
        root.put("123456","张三");
        // 定义输出
        Writer out = new FileWriter(dir + "/freemarker.html");
        template.process(root, out);
        System.out.println("转换成功");
        out.flush();
        out.close();
    }


}
