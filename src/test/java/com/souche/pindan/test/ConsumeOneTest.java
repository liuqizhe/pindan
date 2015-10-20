package com.souche.pindan.test;

import com.souche.pindan.dao.ConsumeMapperDao;
import com.souche.pindan.dao.OnesConsumeMapperDao;
import com.souche.pindan.dao.UserMapperDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by liuqizhe on 15/10/16.
 */
public class ConsumeOneTest {
    String conf = "applicationContext.xml" ;
    ApplicationContext ac = new ClassPathXmlApplicationContext(conf) ;
    ConsumeMapperDao consumeMapperDao = ac.getBean("consumeMapperDao",ConsumeMapperDao.class) ;
    OnesConsumeMapperDao onesConsumeMapperDao = ac.getBean("onesConsumeMapperDao",OnesConsumeMapperDao.class) ;
    UserMapperDao userMapperDao = ac.getBean("userMapperDao",UserMapperDao.class) ;
}
