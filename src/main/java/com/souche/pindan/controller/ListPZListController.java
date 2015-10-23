package com.souche.pindan.controller;

import com.souche.pindan.dao.ListPZMapperDao;
import com.souche.pindan.entity.ListPZ;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * 账单控制类
 * Created by liuqizhe on 15/10/13.
 */
@Controller
@RequestMapping("/listPZ")
public class ListPZListController {
    @Resource
    private ListPZMapperDao dao ;

    public void setDao(ListPZMapperDao dao) {
        this.dao = dao;
    }

    /**
     * 前往账单页面
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String toListPZList(Model model) {
        List<ListPZ> lpz = dao.findAll() ;
        model.addAttribute("listPZ",lpz) ;
        return "listPZ_list" ;
    }

}
