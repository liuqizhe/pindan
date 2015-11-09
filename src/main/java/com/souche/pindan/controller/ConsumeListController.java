package com.souche.pindan.controller;

import com.alibaba.fastjson.JSONArray;
import com.souche.pindan.dao.ConsumeMapperDao;
import com.souche.pindan.dao.OnesConsumeMapperDao;
import com.souche.pindan.entity.Consume;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 消费查询控制类
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

    /**
     * 前往消费查询页面
     * @param model
     * @return
     */
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

    /**
     * 按日期查询消费
     * @param consTime
     * @param model
     * @return
     */
    @RequestMapping("toTime")
    @ResponseBody
    public String toTime(@RequestParam(value = "consTime",required = false) String consTime, Model model) {
        List<Consume> list = consumeMapperDaodao.findByTime(consTime) ;

        for (Consume c : list) {
            int consNo = c.getConsNo() ;
            List<Integer> userNo = onesConsumeMapperDao.findUser(consNo) ;
            String u = userNo.toString() ;
            c.setUser(u);
        }

        String str = JSONArray.toJSONString(list,true) ;
        return str ;


//        model.addAttribute("consumeTime",list) ;

//        return "consume_time" ;
    }
}
