package com.souche.pindan.controller;

import com.souche.pindan.dao.*;
import com.souche.pindan.entity.Consume;
import com.souche.pindan.entity.ListPZ;
import com.souche.pindan.entity.OnesConsume;
import com.souche.pindan.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * 消费控制类2（已停用）
 * Created by liuqizhe on 15/10/14.
 */
@Controller
@RequestMapping("/consume")
public class ConsumeOneController {
    @Resource
    private ConsumeMapperDao consumeMapperDao ;
    @Resource
    private OnesConsumeMapperDao onesConsumeMapperDao ;
    @Resource
    private UserMapperDao userMapperDao ;
    @Resource
    private AccountMapperDao accountMapperDao ;
    @Resource
    private ListPZMapperDao listPZMapperDao ;

    public void setOnesConsumeMapperDao(OnesConsumeMapperDao onesConsumeMapperDao) {
        this.onesConsumeMapperDao = onesConsumeMapperDao;
    }

    public void setConsumeMapperDao(ConsumeMapperDao consumeMapperDao) {
        this.consumeMapperDao = consumeMapperDao;
    }

    public void setUserMapperDao(UserMapperDao userMapperDao) {
        this.userMapperDao = userMapperDao;
    }

    public void setAccountMapperDao(AccountMapperDao accountMapperDao) {
        this.accountMapperDao = accountMapperDao;
    }

    public void setListPZMapperDao(ListPZMapperDao listPZMapperDao) {
        this.listPZMapperDao = listPZMapperDao;
    }

    /**
     * 消费提交，写入数据
     * @param restrant
     * @param consPrice
     * @param userNo
     * @param model
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/commitConsume")
    public String commitConsume(@RequestParam(value = "restrant",required = false) String restrant,
                                @RequestParam(value = "consPrice",required = false) Double consPrice,
                                @RequestParam(value = "User",required = false) List<Integer> userNo,Model model) {
        if (userNo != null) {

//        System.out.println(restrant);
//        System.out.println(consPrice);
//        System.out.println(userNo.size());
//        for(Integer u : userNo) {
//            System.out.println(u);
//        }

            double onesPrice = consPrice / userNo.size();
            if(consPrice > accountMapperDao.findTotalMoney()) {
                model.addAttribute("error1","账户余额不足") ;
                return "redirect:/consume/toConsume.from" ;
            }

            //总账户扣款
            double accountMoney = accountMapperDao.findTotalMoney() - consPrice;
            accountMapperDao.updateAccount(accountMoney);
            //记录消费和账单
            Consume consume = new Consume();
            consume.setRestrant(restrant);
            consume.setConsPrice(consPrice);
            consumeMapperDao.addConsume(consume);
            ListPZ listPZ = new ListPZ();
            int listNo = consumeMapperDao.findLastId();
            listPZ.setListNo(listNo);
            listPZ.setListMoney(consPrice);
            listPZ.setLastMoney(accountMoney);
            listPZMapperDao.addConsumeList(listPZ);

            for (Integer u : userNo) {
                if(consPrice > userMapperDao.findUserMoney(u)) {
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
                onesConsume.setRestrant(restrant);
                onesConsume.setUserNo(u);
                onesConsume.setOnesPrice(onesPrice);
                onesConsume.setUserName(userMapperDao.findUserName(u));
                onesConsumeMapperDao.addOnesConsume(onesConsume);

            }

            model.addAttribute("count", userNo.size());
            model.addAttribute("onesPrice", onesPrice);

            return "consume_finish";
        }else {
            model.addAttribute("error", "请选择拼单用户") ;
            Consume consume = new Consume() ;
            consume.setRestrant(restrant);
            consume.setConsPrice(consPrice);
            model.addAttribute("consume",consume) ;
            return "redirect:/consume/toOnesConsume.from?consume="+consume ;
        }
    }
}
