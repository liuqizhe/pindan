package com.souche.pindan.dao;

import com.souche.pindan.annotation.MyBatisDao;
import com.souche.pindan.entity.Consume;

import java.util.List;

/**
 * Created by liuqizhe on 15/10/14.
 */
@MyBatisDao
public interface ConsumeMapperDao {
    public void addConsume(Consume consume) ;
    public List<Consume> findAll() ;
    public List<Consume> findByTime(String consTime) ;
    public int findLastId() ;
}
