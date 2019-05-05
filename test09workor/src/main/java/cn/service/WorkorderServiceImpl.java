package cn.service;

import cn.dao.WorkorderMapper;
import cn.entity.Workorder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class WorkorderServiceImpl implements WorkorderService{
    @Autowired
    private WorkorderMapper workorderMapper;

    @Override
    public Integer addWorkorder(Workorder workorder) {
        return workorderMapper.addWorkorder(workorder);
    }

    @Override
    public List<Workorder> findAllWorkorder() {
        return workorderMapper.findAllWorkorder();
    }
}
