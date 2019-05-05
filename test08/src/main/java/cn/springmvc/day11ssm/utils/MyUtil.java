package cn.springmvc.day11ssm.utils;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MyUtil {
    private PreparedStatement ps;
    private Connection con;
    private ResultSet rs;

    public Boolean getConnection(){
        Boolean flag = false;
        String driver = "spring.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
        String username = "root";
        String pwd = "1234";
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url,username,pwd);
            flag = true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public List<String> findAllTableNames(){
        String sql = "select table_name tname from information_schema.tables where table_schema='test'";
        List<String> list = new ArrayList<>();
        if(getConnection()){
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    String str = rs.getString("tname");
                    list.add(str);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally{
                if(rs != null){
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if(ps != null){
                    try {
                        ps.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if(con != null){
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return list;
    }

    public static void main(String[] args) {
        MyUtil mu = new MyUtil();
        List<String> list = mu.findAllTableNames();
        SAXReader reader = new SAXReader();
        try {
            Document document = reader.read(new File("E:\\ziliao\\IntelliJ IDEA 2017.2.7\\test\\test08\\src\\main\\resources\\generatorConfig.xml"));
            Element root = document.getRootElement();
            Element rootEle = root.element("context");
            for (int i = 0; i < list.size(); i++) {
                Element resource = rootEle.addElement("table");
                resource.addAttribute("schema","t23");
                resource.addAttribute("tableName", list.get(i));
                resource.addAttribute("domainObjectName","");
                resource.addAttribute("enableCountByExample","false");
                resource.addAttribute("enableDeleteByExample","false");
                resource.addAttribute("enableSelectByExample","false");
                resource.addAttribute("enableUpdateByExample","false");
            }
            OutputFormat format = OutputFormat.createPrettyPrint();
            format.setEncoding("utf-8");
            XMLWriter writer = new XMLWriter(new FileWriter("E:\\ziliao\\IntelliJ IDEA 2017.2.7\\test\\test08\\src\\main\\resources\\generatorConfig.xml"),format);
            writer.write(document);
            writer.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
