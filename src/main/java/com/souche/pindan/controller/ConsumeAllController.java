package com.souche.pindan.controller;

import com.souche.pindan.dao.UserMapperDao;
import com.souche.pindan.entity.Consume;
import com.souche.pindan.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * 消费控制类1（已停用）
 * Created by liuqizhe on 15/10/14.
 */
@Controller
@RequestMapping("/consume")
public class ConsumeAllController {
    @Resource
    private UserMapperDao dao ;

    public void setDao(UserMapperDao dao) {
        this.dao = dao;
    }

    /**
     * 前往填写消费信息界面
     * @param error
     * @param consume
     * @param model
     * @return
     */
//    @RequestMapping("/toConsume")
//    public String toConsume(@RequestParam(value = "error",required = false) String error,
//                            @RequestParam(value = "error1", required = false) String error1,Model model) {
//        model.addAttribute("error",error) ;
//        model.addAttribute("error1",error1) ;
//        return "consume_all" ;
//    }

    /**
     * 前往选择用户界面
     * @param error
     * @param consume
     * @param model
     * @return
     */
    @RequestMapping("/toOnesConsume")
    public String toOnesConsume(@RequestParam(value="error",required = false) String error,Consume consume,Model model) {
        if(consume.getRestrant() != "" && consume.getConsPrice() != null) {
            List<User> list = dao.findAll();
            model.addAttribute("user", list);
            model.addAttribute("consume", consume);
            model.addAttribute("error",error) ;
            return "consume_one";
        } else {
            model.addAttribute("error","请输入消费信息") ;
            return "redirect:/consume/toConsume.from" ;
        }
    }

}
