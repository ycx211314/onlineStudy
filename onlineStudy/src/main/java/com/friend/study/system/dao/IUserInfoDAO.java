package com.friend.study.system.dao;

import com.friend.study.system.model.UserInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Prince
 * Date: 13-1-20
 * Time: 下午6:00
 * To change this template use File | Settings | File Templates.
 */
public interface IUserInfoDAO {
    public boolean save(UserInfo vo)throws Exception;

    public List<UserInfo> find()throws Exception;
}
