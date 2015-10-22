package com.souche.pindan.controller;

import com.souche.pindan.dao.ConsumeMapperDao;
import com.souche.pindan.dao.OnesConsumeMapperDao;
import com.souche.pindan.dao.UserMapperDao;
import com.souche.pindan.entity.Consume;
import com.souche.pindan.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liuqizhe on 15/10/21.
 */
@Controller
@RequestMapping("consume")
public class ConsumeWayController {
    @Resource
    private ConsumeMapperDao consumeMapperDao ;
    @Resource
    private OnesConsumeMapperDao onesConsumeMapperDao ;
    @Resource
    private UserMapperDao userMapperDao ;

    public void setConsumeMapperDao(ConsumeMapperDao consumeMapperDao) {
        this.consumeMapperDao = consumeMapperDao;
    }

    public void setOnesConsumeMapperDao(OnesConsumeMapperDao onesConsumeMapperDao) {
        this.onesConsumeMapperDao = onesConsumeMapperDao;
    }

    public void setUserMapperDao(UserMapperDao userMapperDao) {
        this.userMapperDao = userMapperDao;
    }


//    @RequestMapping("/toConsume")
//    public String toConsume(@RequestParam(value = "error",required = false) String error, Model model) {
//        List<User> list = userMapperDao.findAll() ;
////        model.addAttribute("userGet",userGet) ;
////        for(User u : userGet) {
////            System.out.println(u);
////        }
//        model.addAttribute("user",list) ;
//        model.addAttribute("error",error) ;
//        return "consume_consume" ;
//    }

    @RequestMapping("consume")
    public String goConsume(Consume consume,User user,User userGet,Model model) {
        //List<User> list = userMapperDao.findAll() ;


        return "consume_consume" ;
    }

    @RequestMapping("/getUser")
    public String getUser(@RequestParam(value = "User",required = false) List<Integer> get,
                          @RequestParam(value = "restrant",required = false) String restrant,
                          @RequestParam(value = "consPrice",required = false) Double consPrice,
                          Model model) {
        List<Integer> userNo = get ;
        List<User> userGet = new ArrayList<User>() ;
        for(int u : userNo) {
//            System.out.println(u);
            userGet.add(userMapperDao.findById(u)) ;
        }
        List<User> u =userMapperDao.findAll() ;
        Consume consume = new Consume();
        consume.setRestrant(restrant);
        consume.setConsPrice(consPrice);
        System.out.println(consume.getRestrant()+" "+consume.getConsPrice());
//        for (User u : userGet) {
//            System.out.println(u.getUserMail());
//        }
//        return "" ;
        model.addAttribute("consume",consume) ;
        model.addAttribute("user",u) ;
        model.addAttribute("userGet",userGet) ;
        return "consume_consume2" ;
    }
}
