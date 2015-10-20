package com.souche.pindan.dao;

import com.souche.pindan.annotation.MyBatisDao;
import com.souche.pindan.entity.ListPZ;

import java.util.List;

/**
 * Created by liuqizhe on 15/10/12.
 */
@MyBatisDao
public interface ListPZMapperDao {
    public void addTopupList(ListPZ list) ;
    public void addConsumeList(ListPZ list) ;
    public void addDeleteList(ListPZ list) ;
    public List<ListPZ> findAll() ;
    public List<ListPZ> findByType(String type) ;
}
