package com.souche.pindan.controller;

import com.souche.pindan.dao.AccountMapperDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by liuqizhe on 15/10/14.
 */
@Controller
@RequestMapping("/account")
public class AccountShowController {
    @Resource
    private AccountMapperDao dao ;

    public void setDao(AccountMapperDao dao) {
        this.dao = dao;
    }

    @RequestMapping("/show")
    public String showAccount(Model model) {
        double totalMoney =  dao.findTotalMoney() ;
        model.addAttribute("totalMoney",totalMoney) ;
        return "account_show" ;
    }
}
