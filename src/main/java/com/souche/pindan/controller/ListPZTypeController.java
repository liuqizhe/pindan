package com.souche.pindan.controller;

import com.alibaba.fastjson.JSONArray;
import com.souche.pindan.dao.ListPZMapperDao;
import com.souche.pindan.entity.ListPZ;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 账单类型控制类
 * Created by liuqizhe on 15/10/14.
 */
@Controller
@RequestMapping("/listPZ")
public class ListPZTypeController {
    @Resource
    private ListPZMapperDao dao ;

    public void setDao(ListPZMapperDao dao) {
        this.dao = dao;
    }

    /**
     * 账单类型控制类
     * @param type
     * @param model
     * @return
     */
    @RequestMapping("/toType")
    @ResponseBody
    public String toListPZType(@RequestParam(value = "listType",required = false) String type,Model model) {
//        if (type != "0") {
//            List<ListPZ> lpz = dao.findByType(type);
//            model.addAttribute("listPZ", lpz);
//            return "listPZ_type";
//        } else {
//            model.addAttribute("error","请选择类型查询") ;
//            return "redirect:/listPZ/list.from" ;
//        }
        List<ListPZ> lp = dao.findByType(type) ;
        String str = JSONArray.toJSONString(lp,true) ;
        return str ;
    }
}
