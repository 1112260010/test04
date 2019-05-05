package cn.service;

import cn.entity.Workorder;

import java.util.List;

public interface WorkorderService {

    public Integer addWorkorder(Workorder workorder);

    public List<Workorder> findAllWorkorder();
}
