package com.souche.pindan.controller;

import com.souche.pindan.dao.*;
import com.souche.pindan.entity.Account;
import com.souche.pindan.entity.ListPZ;
import com.souche.pindan.entity.Topup;
import com.souche.pindan.entity.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.NestedServletException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by liuqizhe on 15/10/13.
 */
@Controller
@RequestMapping("/user")
public class UserTopupController {
    @Resource
    private TopupMapperDao topupMapperDao ;
    @Resource
    private ListPZMapperDao listPZMapperDao ;
    @Resource
    private UserMapperDao userMapperDao ;
    @Resource
    private AccountMapperDao accountMapperDao ;

    public void setTopupMapperDao(TopupMapperDao topupMapperDao) {
        this.topupMapperDao = topupMapperDao;
    }

    public void setListPZMapperDao(ListPZMapperDao listPZMapperDao) {
        this.listPZMapperDao = listPZMapperDao;
    }

    public void setUserMapperDao(UserMapperDao userMapperDao) {
        this.userMapperDao = userMapperDao;
    }

    public void setAccountMapperDao(AccountMapperDao accountMapperDao) {
        this.accountMapperDao = accountMapperDao;
    }

    /**
     * 进入充值页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("toTopup")
    public String toTopup(@RequestParam(value="error",required = false) String error,@RequestParam(value="userNo",required = false) Integer id,Model model) {
        User user = userMapperDao.findById(id) ;
        model.addAttribute("user",user) ;
        model.addAttribute("error",error);
        return "topup_one" ;
    }

    /**
     * 提交充值数据，一旦有异常所有操作回滚
     * @param money
     * @param userNo
     * @return
     */
    @RequestMapping("topupMoney")
    @Transactional(rollbackFor = Exception.class)
    public ModelAndView topupMoney(@RequestParam(value="money",required = false) Double money,
                             @RequestParam(value = "userNo",required = false) Integer userNo,Model model) {
        if(money != null) {
            if (money > 0) {
                double userMoney = userMapperDao.findUserMoney(userNo) + money;
                double accountMoney = accountMapperDao.findTotalMoney() + money;


                //将充值金额放入个人钱包和总账
                User u = new User();
                u.setUserNo(userNo);
                u.setPokeyMoney(userMoney);
                userMapperDao.updateUserMoney(u);
                accountMapperDao.updateAccount(accountMoney);


                //记录充值和账单
                Topup topup = new Topup();
                topup.setUserNo(userNo);
                topup.setTopupMoney(money);
                topupMapperDao.addTopup(topup);
                ListPZ listPZ = new ListPZ();
                int listNo = topupMapperDao.findLastId();
                listPZ.setListNo(listNo);
                listPZ.setListMoney(money);
                listPZ.setLastMoney(accountMoney);
                listPZMapperDao.addTopupList(listPZ);

                //测试异常事务回滚
                //int i = 4 / 0;


                return new ModelAndView("redirect:/user/list.from");
            } else {
//
//                try {
//
//                    request.getRequestDispatcher("/toTopup").forward(request,response);
//                    return null;
//                } catch (ServletException e) {
//                    e.printStackTrace();
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
                ModelAndView modelAndView = new ModelAndView("redirect:/user/toTopup.from?userNo="+userNo);
                modelAndView.addObject("error", "请输入正确的金额");
                return modelAndView;
            }
        } else {
            model.addAttribute("error","请输入金额") ;
            return new ModelAndView("redirect:/user/toTopup.from?userNo="+userNo) ;
        }
    }
}
