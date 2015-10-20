package com.souche.pindan.entity;

import java.util.Date;

/**
 * Created by liuqizhe on 15/10/9.
 */
public class Consume {
    private Integer consNo ;
    private String restrant ;
    private Double consPrice ;
    private Date consTime ;
    private String user ;

    public Integer getConsNo() {
        return consNo;
    }

    public void setConsNo(Integer consNo) {
        this.consNo = consNo;
    }

    public String getRestrant() {
        return restrant;
    }

    public void setRestrant(String restrant) {
        this.restrant = restrant;
    }

    public Double getConsPrice() {
        return consPrice;
    }

    public void setConsPrice(Double consPrice) {
        this.consPrice = consPrice;
    }

    public Date getConsTime() {
        return consTime;
    }

    public void setConsTime(Date consTime) {
        this.consTime = consTime;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
}
