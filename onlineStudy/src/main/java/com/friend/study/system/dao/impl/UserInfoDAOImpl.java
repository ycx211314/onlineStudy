package com.friend.study.system.dao.impl;

import com.friend.base.util.Page;
import com.friend.study.system.dao.IUserInfoDAO;
import com.friend.study.system.model.UserInfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Prince
 * Date: 13-1-20
 * Time: 下午6:23
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class UserInfoDAOImpl implements IUserInfoDAO {

    @Resource
    private SqlSessionTemplate conTemplate;
    //implment IDAO interface
    public void setConTemplate(SqlSessionTemplate conTemplate) {
        this.conTemplate = conTemplate;
    }

    /**
     * 增加一条记录
     *
     * @param vo 数据对象
     * @return 数据主键值
     * @throws Exception 抛出错误异常
     */
    @Override
    public Integer insert(UserInfo vo) throws Exception {
        int res = conTemplate.insert("UserInfo.regist",vo);
        return res;
    }

    /**
     * 登录
     *
     * @param loginName 用户名
     * @param loginPwd  密码
     * @param cookies   登录cookies，用于记住登录
     * @return 是否登录成功
     * @throws Exception 出错抛出异常
     */
    @Override
    public UserInfo login(String loginName, String loginPwd, String cookies) throws Exception {
        Map<String,Object> param = new HashMap<String, Object>();
        param.put("userName",loginName);
        param.put("password",loginPwd);
        UserInfo loginer = (UserInfo) this.conTemplate.selectOne("UserInfo.login",param);
        return loginer;  //To change body of implemented methods use File | Settings | File Templates.
    }

    /**
     * 第三方登录
     *
     * @param thirdInfo 第三方登录返回信息
     * @param from      来源
     * @return 注册是否成
     * @throws Exception 异常上抛
     */
    @Override
    public int registThird(String thirdInfo, String from) throws Exception {
        return 0;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public int delete(Map<String, Object> param) throws Exception {
        return 0;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public int update(Map<String, Object> param) throws Exception {
        return 0;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public UserInfo findByPK(Integer integer) throws Exception {
        this.conTemplate.selectOne("UserInfo.findById",integer);
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Page<UserInfo> search(Page<UserInfo> config, Map<String, Object> map) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
