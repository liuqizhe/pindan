package com.souche.pindan.dao;

import com.souche.pindan.annotation.MyBatisDao;
import com.souche.pindan.entity.OnesConsume;

import java.util.List;

/**
 * Created by liuqizhe on 15/10/14.
 */
@MyBatisDao
public interface OnesConsumeMapperDao {
    public void addOnesConsume(OnesConsume onesConsume) ;
    public List<OnesConsume> findOnesConsumeById(int id) ;
    public List<Integer> findUser(int id) ;
}
