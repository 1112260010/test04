package cn.spring.day14jdbcTemplate.util;


import org.springframework.jdbc.core.RowMapper;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyRowMapper implements RowMapper<Object> {

    private Class<?> cl;

    public MyRowMapper(Class<?> cl){
        this.cl = cl;
    }
    @Override
    public Object mapRow(ResultSet rs, int i) throws SQLException {
        /*Book book = new Book();
        book.setBookid(rs.getInt("bookid"));
        book.setBookname(rs.getString("bookname"));
        book.setBookprice(rs.getInt("bookprice"));
        return book;*/


            Field[] field = cl.getDeclaredFields();
        Object obj = null;
        try {
            obj = cl.newInstance();
            for(Field item:field){
                item.setAccessible(true);
                this.typeMapper(item,obj,rs);
                item.setAccessible(false);
            }
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return obj;
    }

    private void typeMapper(Field field, Object obj, ResultSet rs) throws Exception {
        String type = field.getType().getName();
        if (type.equals("java.lang.String")) {
            field.set(obj, rs.getString(field.getName()));
        } else if (type.equals("int") || type.equals("java.lang.Integer")) {
            field.set(obj, rs.getInt(field.getName()));
        } else if (type.equals("long") || type.equals("java.lang.Long")) {
            field.set(obj, rs.getLong(field.getName()));
        } else if (type.equals("boolean") || type.equals("java.lang.Boolean")) {
            field.set(obj, rs.getBoolean(field.getName()));
        } else if (type.equals("java.util.Date")) {
            field.set(obj, rs.getDate(field.getName()));
        }
    }
}
