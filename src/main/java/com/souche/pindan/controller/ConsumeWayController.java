package com.souche.pindan.controller;

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

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 消费控制类总
 * Created by liuqizhe on 15/10/21.
 */
@Controller
@RequestMapping("consume")
public class ConsumeWayController {
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
        return "consume_consume3" ;
    }

    /**
     * 提交消费，写入数据
     * @param consume
     * @param userGet
     * @param model
     * @return
     */
    @RequestMapping("consume")
    @Transactional(rollbackFor = Exception.class)
    public String goConsume(Consume consume,@RequestParam(value = "UserGet",required = false) List<Integer> userGet,Model model) {
        //List<User> list = userMapperDao.findAll() ;
        if(consume.getRestrant() != "" && consume.getConsPrice() != null) {
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
     * 获取消费人员，重新获取页面
     * @param get
     * @param userGet
     * @param consume
     * @param page
     * @param model
     * @return
     */
    @RequestMapping("/getUser")
    public String getUser(@RequestParam(value = "User",required = false) List<Integer> get,
                          @RequestParam(value = "UserGet",required = false) List<Integer> userGet,
                          Consume consume,Page page,
                          Model model) {
//        System.out.println(userGet);
        if (userGet != null) {
            get.addAll(userGet);
        }
        for(int i=0 ; i < get.size() ; i ++) {
            for(int j=get.size()-1 ; j > i ; j --) {
                if (get.get(i) == get.get(j)) {
                    get.remove(j);
                }
            }
        }
        List<Integer> userNo = get ;
//        System.out.println(userNo);
        List<User> uGet = new ArrayList<User>() ;
        for(int u : userNo) {
//            System.out.println(u);
            uGet.add(userMapperDao.findById(u)) ;
        }

//        List<User> u =userMapperDao.findAll() ;
        List<User> u = userMapperDao.findByPage(page) ;
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
//        Consume consume = new Consume();
//        consume.setRestrant(restrant);
//        consume.setConsPrice(consPrice);
//        System.out.println(consume.getRestrant()+" "+consume.getConsPrice());
//        for (User u : userGet) {
//            System.out.println(u.getUserMail());
//        }
//        return "" ;
        model.addAttribute("page",page) ;
        model.addAttribute("consume",consume) ;
        model.addAttribute("user",u) ;
        model.addAttribute("userGet",uGet) ;
        return "consume_consume4" ;
    }

    /**
     * 分页查询，重新获取页面
     * @param userGet
     * @param consume
     * @param page
     * @param model
     * @return
     */
    @RequestMapping("/changePage")
    public String changePage(@RequestParam(value = "UserGet",required = false) List<Integer> userGet,
                          Consume consume,Page page,
                          Model model) {
//        System.out.println(userGet);
        List<Integer> userNo = userGet ;
//        System.out.println(userNo);
        List<User> uGet = new ArrayList<User>() ;
        for(int u : userNo) {
//            System.out.println(u);
            uGet.add(userMapperDao.findById(u)) ;
        }

//        List<User> u =userMapperDao.findAll() ;
        List<User> u = userMapperDao.findByPage(page) ;
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
//        Consume consume = new Consume();
//        consume.setRestrant(restrant);
//        consume.setConsPrice(consPrice);
//        System.out.println(consume.getRestrant()+" "+consume.getConsPrice());
//        for (User u : userGet) {
//            System.out.println(u.getUserMail());
//        }
//        return "" ;
        model.addAttribute("page",page) ;
        model.addAttribute("consume",consume) ;
        model.addAttribute("user",u) ;
        model.addAttribute("userGet",uGet) ;
        return "consume_consume4" ;
    }

    /**
     * 提交失败，重新获取页面
     * @param model
     * @return
     */
    @RequestMapping("/falseCommit")
    public String falseCommit(Model model) {
        model.addAttribute("error","请选择拼单用户") ;
        return "redirect:/consume/toConsume.from" ;
    }
}
