package com.souche.pindan.dao;

import com.souche.pindan.annotation.MyBatisDao;
import com.souche.pindan.entity.Account;

/**
 * Created by liuqizhe on 15/10/12.
 */
@MyBatisDao
public interface AccountMapperDao {
    public Double findTotalMoney() ;
    public void updateAccount(double money) ;
}
