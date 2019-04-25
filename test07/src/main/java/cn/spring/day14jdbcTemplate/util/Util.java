package cn.spring.day14jdbcTemplate.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Util<T> {

    public void setValue(Field[] fields, T obj, ResultSet rs){
        try {
            for (int i = 0; i < fields.length; i++) {
                //获取类每个属性的名字,例如：bookid
                String name = fields[i].getName();
                //属性名字首字母大写
                name = name.substring(0, 1).toUpperCase() + name.substring(1);
                //获取属性的类型，比如：class java.lang.String
                String type = fields[i].getGenericType().toString();
                if (type.equals("class java.lang.String")) {
                    String value = rs.getString(name);
                    Method method = obj.getClass().getMethod("set"+name,String.class);
                    method.invoke(obj,value);
                } else if (type.equals("int") || type.equals("java.lang.Integer")) {
                    Integer value = rs.getInt(name);
                    Method method = obj.getClass().getMethod("set"+name,Integer.class);
                    method.invoke(obj,value);
                } else if (type.equals("long") || type.equals("java.lang.Long")) {
                    Long value = rs.getLong(name);
                    Method method = obj.getClass().getMethod("set"+name,Long.class);
                    method.invoke(obj,value);
                } else if (type.equals("boolean") || type.equals("java.lang.Boolean")) {
                    Boolean value = rs.getBoolean(name);
                    Method method = obj.getClass().getMethod("set"+name,Boolean.class);
                    method.invoke(obj,value);
                } else if (type.equals("java.util.Date")) {
                    Date value = rs.getDate(name);
                    Method method = obj.getClass().getMethod("set"+name,Date.class);
                    method.invoke(obj,value);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }
}
