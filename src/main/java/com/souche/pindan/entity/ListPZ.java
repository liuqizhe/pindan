package com.souche.pindan.entity;

import java.util.Date;

/**
 * Created by liuqizhe on 15/10/9.
 */
public class ListPZ {
    private Integer listNo ;
    private String listType ;
    private Date listDate ;
    private Double listMoney ;
    private Double lastMoney ;

    public Integer getListNo() {
        return listNo;
    }

    public void setListNo(Integer listNo) {
        this.listNo = listNo;
    }

    public String getListType() {
        return listType;
    }

    public void setListType(String listType) {
        this.listType = listType;
    }

    public Date getListDate() {
        return listDate;
    }

    public void setListDate(Date listDate) {
        this.listDate = listDate;
    }

    public Double getListMoney() {
        return listMoney;
    }

    public void setListMoney(Double listMoney) {
        this.listMoney = listMoney;
    }

    public Double getLastMoney() {
        return lastMoney;
    }

    public void setLastMoney(Double lastMoney) {
        this.lastMoney = lastMoney;
    }
}
