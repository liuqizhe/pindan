package com.souche.pindan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by liuqizhe on 15/10/14.
 */
@Controller
@RequestMapping("/consume")
public class ConsumeViewController {

    @RequestMapping("/view")
    public String toConsumeView() {
        return "consume_view" ;
    }

}
