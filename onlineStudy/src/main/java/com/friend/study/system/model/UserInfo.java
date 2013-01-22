package com.friend.study.system.model;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-1-15
 * Time: 上午9:37
 * To change this template use File | Settings | File Templates.
 */
public class UserInfo implements Serializable {
    private Integer userId;
    private String neckName;

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
}
