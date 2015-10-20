package com.souche.pindan.dao;

import com.souche.pindan.annotation.MyBatisDao;
import com.souche.pindan.entity.Topup;

import java.util.List;

/**
 * Created by liuqizhe on 15/10/12.
 */
@MyBatisDao
public interface TopupMapperDao {
    public void addTopup(Topup topup) ;
    public List<Topup> findAll() ;
    public int findLastId() ;
    public List<Topup> findByTime(String topupTime) ;
    public Topup findById(int id) ;
}
