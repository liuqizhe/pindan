package com.souche.pindan.controller;

import com.souche.pindan.dao.UserMapperDao;
import com.souche.pindan.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by liuqizhe on 15/10/10.
 */
@Controller
@RequestMapping("/user")
public class UserListController {
    @Resource
    private UserMapperDao dao ;

    public void setDao(UserMapperDao dao) {
        this.dao = dao;
    }

    @RequestMapping("/list")
    public String toUserList(Model model) {
        List<User> list = dao.findAll() ;
        model.addAttribute("users", list) ;
        return "user_list" ;
    }
}
