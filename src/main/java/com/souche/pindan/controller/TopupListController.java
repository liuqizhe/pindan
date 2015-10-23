package com.souche.pindan.controller;

import com.souche.pindan.dao.TopupMapperDao;
import com.souche.pindan.entity.Topup;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * 充值查询控制类
 * Created by liuqizhe on 15/10/14.
 */
@Controller
@RequestMapping("/topup")
public class TopupListController {
    @Resource
    private TopupMapperDao dao ;

    public void setDao(TopupMapperDao dao) {
        this.dao = dao;
    }

    /**
     * 前往充值查询页面
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String listTopup(Model model) {
        List<Topup> list = dao.findAll() ;
        model.addAttribute("topupList", list) ;
        return "topup_list" ;
    }

    /**
     * 按日期查询充值
     * @param topupTime
     * @param model
     * @return
     */
    @RequestMapping("/toTime")
    public String toTime(@RequestParam(value = "topupTime",required = false) String topupTime,Model model) {
        List<Topup> list= dao.findByTime(topupTime) ;
        model.addAttribute("topupTime",list) ;

        return "topup_time" ;
    }
}
