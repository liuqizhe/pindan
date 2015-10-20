package com.souche.pindan.dao;

import com.souche.pindan.annotation.MyBatisDao;
import com.souche.pindan.entity.User;

import java.util.List;

/**
 * Created by liuqizhe on 15/10/9.
 */
@MyBatisDao
public interface UserMapperDao {
    public List<User> findAll() ;
    public User findById(int id) ;
    public void addUser(User user) ;
    public Double findUserMoney(int id) ;
    public String findUserName(int id) ;
    public void updateUserMoney(User user) ;
    public void updateUser(User user) ;
    public void deleteUser(int id) ;
    public List<User> findByPage5(int start,int size) ;
}
