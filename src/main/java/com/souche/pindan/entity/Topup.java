package com.souche.pindan.entity;

import java.util.Date;

/**
 * Created by liuqizhe on 15/10/9.
 */
public class Topup {
    private Integer topupNo ;
    private Integer userNo ;
    private Double topupMoney ;
    private Date topupTime ;

    public Integer getTopupNo() {
        return topupNo;
    }

    public void setTopupNo(Integer topupNo) {
        this.topupNo = topupNo;
    }

    public Integer getUserNo() {
        return userNo;
    }

    public void setUserNo(Integer userNo) {
        this.userNo = userNo;
    }

    public Double getTopupMoney() {
        return topupMoney;
    }

    public void setTopupMoney(Double topupMoney) {
        this.topupMoney = topupMoney;
    }

    public Date getTopupTime() {
        return topupTime;
    }

    public void setTopupTime(Date topupTime) {
        this.topupTime = topupTime;
    }
}
