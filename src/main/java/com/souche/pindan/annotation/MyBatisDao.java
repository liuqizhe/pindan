package com.souche.pindan.annotation;

import org.springframework.stereotype.Repository;

/**
 * Created by liuqizhe on 15/10/9.
 */
@Repository
public @interface MyBatisDao {
    String value() default "" ;
}
