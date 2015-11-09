package com.souche.pindan.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.TypeReference;
import com.souche.pindan.dao.*;
import com.souche.pindan.entity.Consume;
import com.souche.pindan.entity.ListPZ;
import com.souche.pindan.entity.OnesConsume;
import com.souche.pindan.entity.User;
import com.souche.pindan.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 消费控制类总
 * Created by liuqizhe on 15/10/21.
 */
@Controller
@RequestMapping("consume")
public class ConsumeWay2Controller {
    @Resource
    private ConsumeMapperDao consumeMapperDao ;
    @Resource
    private OnesConsumeMapperDao onesConsumeMapperDao ;
    @Resource
    private UserMapperDao userMapperDao ;
    @Resource
    private ListPZMapperDao listPZMapperDao ;
    @Resource
    private AccountMapperDao accountMapperDao ;

    public void setConsumeMapperDao(ConsumeMapperDao consumeMapperDao) {
        this.consumeMapperDao = consumeMapperDao;
    }

    public void setOnesConsumeMapperDao(OnesConsumeMapperDao onesConsumeMapperDao) {
        this.onesConsumeMapperDao = onesConsumeMapperDao;
    }

    public void setUserMapperDao(UserMapperDao userMapperDao) {
        this.userMapperDao = userMapperDao;
    }

    public void setListPZMapperDao(ListPZMapperDao listPZMapperDao) {
        this.listPZMapperDao = listPZMapperDao;
    }

    public void setAccountMapperDao(AccountMapperDao accountMapperDao) {
        this.accountMapperDao = accountMapperDao;
    }

    /**
     * 前往消费信息页面
     * @param error
     * @param page
     * @param model
     * @return
     */
    @RequestMapping("/toConsume")
    public String toConsume(@RequestParam(value = "error",required = false) String error,Page page, Model model) {
//        List<User> list = userMapperDao.findAll() ;
//        model.addAttribute("userGet",userGet) ;
//        for(User u : userGet) {
//            System.out.println(u);
//        }
        List<User> u = userMapperDao.findByPage(page) ;
//        System.out.println(u);
        //计算总页数
        int totalRows = userMapperDao.findRow() ;
        int totalPage = 1 ;
        if(totalRows%page.getPageSize() == 0) {
            totalPage = totalRows/page.getPageSize() ;
        } else {
            totalPage = totalRows/page.getPageSize()+1 ;
        }
        //将总页数放入page对象
        page.setTotalPage(totalPage);
        model.addAttribute("page",page) ;
        model.addAttribute("user",u) ;
        model.addAttribute("error",error) ;
        return "consume_consume5" ;
    }

    /**
     * 提交消费，写入数据
     * @param consume
     * @param userGet
     * @param model
     * @return
     */
    @RequestMapping("/consume1")
    @Transactional(rollbackFor = Exception.class)
    public String goConsume(Consume consume,@RequestParam(value = "UserGet",required = false) List<Integer> userGet,Model model) {
        //List<User> list = userMapperDao.findAll() ;
        if(consume.getRestrant() != "" && consume.getConsPrice() != null && userGet != null) {
            double onesPrice = consume.getConsPrice() / userGet.size();
            if(consume.getConsPrice() > accountMapperDao.findTotalMoney()) {
                model.addAttribute("error1","账户余额不足") ;
                return "redirect:/consume/toConsume.from" ;
            }

            //总账户扣款
            double accountMoney = accountMapperDao.findTotalMoney() - consume.getConsPrice();
            accountMapperDao.updateAccount(accountMoney);
            //记录消费和账单
            consumeMapperDao.addConsume(consume);
            ListPZ listPZ = new ListPZ();
            int listNo = consumeMapperDao.findLastId();
            listPZ.setListNo(listNo);
            listPZ.setListMoney(consume.getConsPrice());
            listPZ.setLastMoney(accountMoney);
            listPZMapperDao.addConsumeList(listPZ);

            for (Integer u : userGet) {
                if(consume.getConsPrice() > userMapperDao.findUserMoney(u)) {
                    model.addAttribute("error1","用户钱包余额不足");
                    return "redirect:/consume/toConsume.from" ;
                }
                double userMoney = userMapperDao.findUserMoney(u) - onesPrice;

                //个人钱包扣款
                User user = new User();
                user.setUserNo(u);
                user.setPokeyMoney(userMoney);
                userMapperDao.updateUserMoney(user);

                //记录个人消费
                OnesConsume onesConsume = new OnesConsume();
                onesConsume.setConsNo(listNo);
                onesConsume.setRestrant(consume.getRestrant());
                onesConsume.setUserNo(u);
                onesConsume.setOnesPrice(onesPrice);
                onesConsume.setUserName(userMapperDao.findUserName(u));
                onesConsumeMapperDao.addOnesConsume(onesConsume);

            }

            model.addAttribute("count", userGet.size());
            model.addAttribute("onesPrice", onesPrice);

            return "consume_finish";

        } else {
            model.addAttribute("error","请输入消费信息") ;
            return "redirect:/consume/toConsume.from" ;
        }
    }

    /**
     * 异步分页查询
     * @param page
     * @return
     */
    @RequestMapping("/changePage2")
    @ResponseBody
    public String changePage2(Page page) {
//        System.out.println(page);
        List<User> u = userMapperDao.findByPage(page) ;
        String str = JSONArray.toJSONString(u,true) ;
        return str ;
    }

    /**
     * 异步添加获取的用户
     * @param str1
     * @return
     */
    @RequestMapping("/getUser2")
    @ResponseBody
    public String getUser2(@RequestParam(value = "userNo",required = false) String str1) {

        List<User> list = JSONArray.parseObject(str1, new TypeReference<List<User>>(){}) ;

        //去掉重复项
        for(int i = 0 ; i < list.size() ; i ++) {
            for (int j = list.size()-1 ; j > i ; j -- ){
                if(list.get(i).getUserNo() == list.get(j).getUserNo()) {
                    list.remove(j) ;
                }
            }
        }

        List<User> list1 = new ArrayList<User>() ;
        for(User user : list) {
            list1.add(userMapperDao.findById(user.getUserNo())) ;
        }
        String str2 = JSONArray.toJSONString(list1,true) ;
        return str2 ;
    }
}
