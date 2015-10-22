package com.souche.pindan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by liuqizhe on 15/10/21.
 */
@Controller
@RequestMapping("/index")
public class PindanIndexController {
    @RequestMapping("/index")
    public String toIndex() {
        return "index_index" ;
    }
}
