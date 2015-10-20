package com.souche.pindan.test;

import com.souche.pindan.dao.ConsumeMapperDao;
import com.souche.pindan.dao.OnesConsumeMapperDao;
import com.souche.pindan.entity.Consume;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by liuqizhe on 15/10/15.
 */
public class ConsumeListTest {
    public static void main(String[] args) {
        String conf = "applicationContext.xml" ;
        ApplicationContext ac = new ClassPathXmlApplicationContext(conf) ;
        ConsumeMapperDao dao1 = ac.getBean("consumeMapperDao", ConsumeMapperDao.class) ;
        OnesConsumeMapperDao dao2 = ac.getBean("onesConsumeMapperDao", OnesConsumeMapperDao.class) ;
        List<Consume> list = dao1.findAll() ;
        for(Consume c : list) {
            int consNo = c.getConsNo() ;
            List<Integer> userNo = dao2.findUser(consNo) ;
            String u = userNo.toString() ;
            System.out.println(consNo+","+c.getRestrant()+","+c.getConsPrice()+","+c.getConsTime()+","+u);
        }
    }
}
