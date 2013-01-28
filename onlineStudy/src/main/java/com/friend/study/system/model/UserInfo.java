package com.friend.study.system.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-1-15
 * Time: 上午9:37
 * To change this template use File | Settings | File Templates.
 */
public class UserInfo implements Serializable {
    private Integer userId;
    /**
     * 用户昵称
     */
    private String neckName;
    /**
     * 登录名
     */
    private String userName;
    /**
     * 第三方登录信息
     */
    private String thirdInfo;
    /**
     * 用户邮箱
     */
    private String email;
    /**
     * 用户密码
     */
    private String password;

    private Integer age;

    private String gender;

    private Date registDate;

    private Date lastloginTs;

    private String loginCookies;

    public UserInfo(Integer pk){
        this.userId=pk;
    }
    public UserInfo(){}
    //Gettger and Setter

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getNeckName() {
        return neckName;
    }

    public void setNeckName(String neckName) {
        this.neckName = neckName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getThirdInfo() {
        return thirdInfo;
    }

    public void setThirdInfo(String thirdInfo) {
        this.thirdInfo = thirdInfo;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getRegistDate() {
        return registDate;
    }

    public void setRegistDate(Date registDate) {
        this.registDate = registDate;
    }

    public Date getLastloginTs() {
        return lastloginTs;
    }

    public void setLastloginTs(Date lastloginTs) {
        this.lastloginTs = lastloginTs;
    }

    public String getLoginCookies() {
        return loginCookies;
    }

    public void setLoginCookies(String loginCookies) {
        this.loginCookies = loginCookies;
    }
}
