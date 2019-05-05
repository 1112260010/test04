package cn.service;

import cn.dao.ProjectMapper;
import cn.entity.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectMapper projectMapper;
    @Override
    public List<Project> findAllProject() {
        return projectMapper.findAllProject();
    }
}
