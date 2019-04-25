package cn.spring.day14jdbcTemplate.util;

import org.springframework.jdbc.core.RowMapper;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RowMapperUtil<T> implements RowMapper{
    private Class<T> clazz;
    T obj;

    public RowMapperUtil(){
        //获取RowMapperUtil<T>类型的类型
        //剥离其中<T>的类型
        ParameterizedType genericSuperclass = (ParameterizedType) (this.getClass().getGenericSuperclass());
        //获取第一个参数（T）的类型
        this.clazz = (Class)(genericSuperclass.getActualTypeArguments()[0]);
    }

    @Override
    public T mapRow(ResultSet rs, int i) throws SQLException {
        try {
            //创建T的实例对象
            obj = (T)clazz.newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        //获取T的属性数组
        Field[] fields = clazz.getDeclaredFields();
        Util<T> util = new Util<T>();
        util.setValue(fields,obj,rs);
        return obj;
    }
}
