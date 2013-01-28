package com.friend.study.system.dao;

import com.friend.base.interfaces.IDAO;
import com.friend.study.system.model.UserInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Prince
 * Date: 13-1-20
 * Time: 下午6:00
 * To change this template use File | Settings | File Templates.
 */
public interface IUserInfoDAO extends IDAO<UserInfo, Integer> {
    /**
     * 登录
     *
     * @param loginName 用户名
     * @param loginPwd  密码
     * @param cookies   登录cookies，用于记住登录
     * @return 是否登录成功
     * @throws Exception 出错抛出异常
     */
    public UserInfo login(String loginName, String loginPwd, String cookies) throws Exception;

    /**
     * 第三方登录
     *
     * @param thirdInfo 第三方登录返回信息
     * @param from      来源
     * @return 注册是否成
     * @throws Exception 异常上抛
     */
    public int registThird(String thirdInfo, String from) throws Exception;
}
