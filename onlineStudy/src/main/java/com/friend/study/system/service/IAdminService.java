package com.friend.study.system.service;

import com.friend.study.system.model.Administartor;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-1-31
 * Time: 下午3:57
 * To change this template use File | Settings | File Templates.
 */
public interface IAdminService {
    /**
     *  管理员登录
     * @param username
     * @param password
     * @return
     * @throws Exception
     */
    public Administartor login(String username,String password)throws Exception;

    public Map<String,Object> findLoginInfomation(String username)throws Exception;
}
