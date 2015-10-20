package com.souche.pindan.controller;

import com.souche.pindan.dao.ConsumeMapperDao;
import com.souche.pindan.dao.OnesConsumeMapperDao;
import com.souche.pindan.entity.Consume;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by liuqizhe on 15/10/14.
 */
@Controller
@RequestMapping("/consume")
public class ConsumeListController {
    @Resource
    private ConsumeMapperDao consumeMapperDaodao ;
    @Resource
    private OnesConsumeMapperDao onesConsumeMapperDao ;

    public void setConsumeMapperDaodao(ConsumeMapperDao consumeMapperDaodao) {
        this.consumeMapperDaodao = consumeMapperDaodao;
    }

    public void setOnesConsumeMapperDao(OnesConsumeMapperDao onesConsumeMapperDao) {
        this.onesConsumeMapperDao = onesConsumeMapperDao;
    }

    @RequestMapping("/list")
    public String listConsume(Model model) {
        List<Consume> list = consumeMapperDaodao.findAll() ;

        Map map = new HashMap() ;
        for (Consume c : list) {
            int consNo = c.getConsNo() ;
            List<Integer> userNo = onesConsumeMapperDao.findUser(consNo) ;
            String u = userNo.toString() ;
            c.setUser(u);
        }

        model.addAttribute("consumeList",list) ;
//        model.addAttribute("userNo",listU) ;
        return "consume_list" ;
    }

    @RequestMapping("toTime")
    public String toTime(@RequestParam(value = "consTime",required = false) String consTime, Model model) {
        List<Consume> list = consumeMapperDaodao.findByTime(consTime) ;
        List<String> listU = new ArrayList<String>() ;
        for (Consume c : list) {
            int consNo = c.getConsNo() ;
            List<Integer> userNo = onesConsumeMapperDao.findUser(consNo) ;
            String u = userNo.toString() ;
            listU.add(u) ;
        }

        model.addAttribute("consumeTime",list) ;
        model.addAttribute("userNo",listU) ;
        return "consume_time" ;
    }
}
