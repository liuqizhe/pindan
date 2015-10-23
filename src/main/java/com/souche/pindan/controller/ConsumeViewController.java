package com.souche.pindan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 消费页面控制类
 * Created by liuqizhe on 15/10/14.
 */
@Controller
@RequestMapping("/consume")
public class ConsumeViewController {

    /**
     * 前往消费页面
     * @return
     */
    @RequestMapping("/view")
    public String toConsumeView() {
        return "consume_view" ;
    }

}
