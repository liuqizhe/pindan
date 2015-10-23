package com.souche.pindan.controller;

import com.souche.pindan.dao.UserMapperDao;
import com.souche.pindan.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * 查找用户控制类
 * Created by liuqizhe on 15/10/12.
 */
@Controller
@RequestMapping("/user")
public class UserFindController {
    @Resource
    private UserMapperDao dao ;

    public void setDao(UserMapperDao dao) {
        this.dao = dao;
    }

    /**
     * 按用户编号查找用户
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/findUser")
    public String find(@RequestParam(value="userNo",required = false) Integer id,Model model) {
        if (id != null) {
            User u = dao.findById(id);
            model.addAttribute("user", u);
            return "user_one";
        } else {
            model.addAttribute("error","请输入用户编号查询") ;
            return "user_list" ;
        }
    }
}
