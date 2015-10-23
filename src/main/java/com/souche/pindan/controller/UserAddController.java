package com.souche.pindan.controller;

import com.souche.pindan.dao.UserMapperDao;
import com.souche.pindan.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * 用户添加控制类
 * Created by liuqizhe on 15/10/10.
 */
@Controller
@RequestMapping("/user")
public class UserAddController {
    @Resource
    private UserMapperDao dao ;

    public void setDao(UserMapperDao dao) {
        this.dao = dao;
    }

    /**
     * 前往添加页面
     * @param error
     * @param model
     * @return
     */
    @RequestMapping("/toAdd")
    public String toUserAdd(@RequestParam(value = "error",required = false) String error,Model model) {
        model.addAttribute("error",error) ;
        return "user_add" ;
    }

    /**
     * 添加用户
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/addUser")
    public String add(User user,Model model) {
        if(user.getUserName() != "" && user.getUserMail() != "") {
//        if(user != null) {
            System.out.println(user);
            System.out.println(user.getUserName());
            System.out.println(user.getUserMail());
            dao.addUser(user);
            return "redirect:/user/list.from";
        }else {
            model.addAttribute("error","不能为空") ;
//            System.out.println("不能为空");
            return "redirect:/user/toAdd.from" ;
        }
    }
}
