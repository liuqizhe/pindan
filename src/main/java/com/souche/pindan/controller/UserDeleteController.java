package com.souche.pindan.controller;

import com.souche.pindan.dao.AccountMapperDao;
import com.souche.pindan.dao.ListPZMapperDao;
import com.souche.pindan.dao.UserMapperDao;
import com.souche.pindan.entity.ListPZ;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * 用户删除控制类
 * Created by liuqizhe on 15/10/14.
 */
@Controller
@RequestMapping("user")
public class UserDeleteController {
    @Resource
    private UserMapperDao userMapperDao ;
    @Resource
    private ListPZMapperDao listPZMapperDao ;
    @Resource
    private AccountMapperDao accountMapperDao ;

    public void setUserMapperDao(UserMapperDao userMapperDao) {
        this.userMapperDao = userMapperDao;
    }

    public void setListPZMapperDao(ListPZMapperDao listPZMapperDao) {
        this.listPZMapperDao = listPZMapperDao;
    }

    public void setAccountMapperDao(AccountMapperDao accountMapperDao) {
        this.accountMapperDao = accountMapperDao;
    }

    /**
     * 删除用户，写入数据
     * @param id
     * @return
     */
    @RequestMapping("/deleteUser")
    public String deleteUser(@RequestParam(value = "userNo",required = false) Integer id) {
        if(id != null) {
            //获取删除用户的钱包余额
            double userMoney = userMapperDao.findUserMoney(id) ;

            //计算总账户余额
            double totalMoney = accountMapperDao.findTotalMoney() ;
            totalMoney -= userMoney ;

            ListPZ lpz = new ListPZ() ;
            lpz.setListNo(id);
            lpz.setListMoney(userMoney);
            lpz.setLastMoney(totalMoney);

            userMapperDao.deleteUser(id);
            accountMapperDao.updateAccount(totalMoney);
            listPZMapperDao.addDeleteList(lpz);
        }
        return "redirect:list.from" ;
    }
}
