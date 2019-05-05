package cn.dao;

import cn.entity.Project;

import java.util.List;

public interface ProjectMapper {
    int deleteByPrimaryKey(Long pid);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(Long pid);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKey(Project record);

    //查询所有项目
    List<Project> findAllProject();
}