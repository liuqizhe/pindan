package com.souche.pindan.entity;

import java.util.Date;

/**
 * Created by liuqizhe on 15/10/9.
 */
public class OnesConsume {
    private Integer consNo ;
    private String restrant ;
    private Integer userNo ;
    private String userName ;
    private Double onesPrice ;
    private Date consTime ;

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

    public Integer getUserNo() {
        return userNo;
    }

    public void setUserNo(Integer userNo) {
        this.userNo = userNo;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Double getOnesPrice() {
        return onesPrice;
    }

    public void setOnesPrice(Double onesPrice) {
        this.onesPrice = onesPrice;
    }

    public Date getConsTime() {
        return consTime;
    }

    public void setConsTime(Date consTime) {
        this.consTime = consTime;
    }
}
