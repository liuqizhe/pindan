package com.souche.pindan.test;

import com.souche.pindan.dao.UserMapperDao;
import com.souche.pindan.entity.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by liuqizhe on 15/10/10.
 */
public class UserTest {
    public static void main(String[] args) {
        String conf = "applicationContext.xml" ;
        ApplicationContext ac = new ClassPathXmlApplicationContext(conf) ;
        //默认采用MapperDao接口名当做实例Bean的id
        UserMapperDao dao = ac.getBean("userMapperDao",UserMapperDao.class) ;
        List<User> list = dao.findAll() ;
        for (User u : list) {
            System.out.println(u.getUserNo()+" "+u.getUserName()+" "+u.getJoinDate()+" "+u.getUserMail());
        }
        User u  = dao.findById(1) ;
        System.out.println(u);

    }
}
