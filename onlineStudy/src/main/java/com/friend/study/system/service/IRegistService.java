package com.friend.study.system.service;

import com.friend.study.system.model.UserInfo;

/**
 * Created with IntelliJ IDEA.
 * User: Prince
 * Date: 13-1-27
 * Time: 下午9:56
 * To change this template use File | Settings | File Templates.
 */
public interface IRegistService {
    /**
     * 注册用户
     * @param vo
     * @return
     * @throws Exception
     */
    public boolean regist(UserInfo vo) throws Exception;

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     * @throws Exception
     */
    public UserInfo login(String username,String password)throws Exception;

    /**
     * 判断用户名，邮箱，是否唯一
     * @param code 验证值
     * @param type       类型
     * @return               存在返回true,不存在返回false
     * @throws Exception
     */
    public boolean isExsit(String code,int type)throws Exception;
}
