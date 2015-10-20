package com.souche.pindan.entity;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * Created by liuqizhe on 15/10/9.
 */
public class User {
    private Integer userNo ;
    @NotNull(message = "用户姓名不能为空")
    @Length(min=5, max=20, message="用户名长度必须在5-20之间")
    private String userName ;
    private Date joinDate ;
    private Double pokeyMoney ;
    @NotNull(message = "用户邮箱不能为空")
    private String userMail ;

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

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public Double getPokeyMoney() {
        return pokeyMoney;
    }

    public void setPokeyMoney(Double pokeyMoney) {
        this.pokeyMoney = pokeyMoney;
    }

    public String getUserMail() {
        return userMail;
    }

    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }

    @Override
    public String toString() {
        return "User{" +
                "userNo=" + userNo +
                ", userName='" + userName + '\'' +
                ", joinDate=" + joinDate +
                ", pokeyMoney=" + pokeyMoney +
                ", userMail='" + userMail + '\'' +
                '}';
    }
}
