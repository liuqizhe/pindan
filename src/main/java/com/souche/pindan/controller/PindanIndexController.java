package com.souche.pindan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 主页控制类
 * Created by liuqizhe on 15/10/21.
 */
@Controller
@RequestMapping("/index")
public class PindanIndexController {
    /**
     * 前往主页
     * @return
     */
    @RequestMapping("/index")
    public String toIndex() {
        return "index_index" ;
    }
}
