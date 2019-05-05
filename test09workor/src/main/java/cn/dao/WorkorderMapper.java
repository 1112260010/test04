package cn.dao;

import cn.entity.Workorder;

import java.util.List;

public interface WorkorderMapper {
    int deleteByPrimaryKey(Long wid);

    int insert(Workorder record);

    int insertSelective(Workorder record);

    Workorder selectByPrimaryKey(Long wid);

    int updateByPrimaryKeySelective(Workorder record);

    int updateByPrimaryKey(Workorder record);

    //添加工单
    Integer addWorkorder(Workorder workorder);

    //查询所有工单
    List<Workorder> findAllWorkorder();
}