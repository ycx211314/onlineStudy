package com.friend.study.system.service.impl;

import com.friend.study.system.dao.IUserInfoDAO;
import com.friend.study.system.model.UserInfo;
import com.friend.study.system.service.IRegistService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created with IntelliJ IDEA.
 * User: Prince
 * Date: 13-1-27
 * Time: 下午9:57
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class RegistServiceImpl implements IRegistService {
    @Resource
    private IUserInfoDAO dao;
    public void setDao(IUserInfoDAO dao) {
        this.dao = dao;
    }

    @Override
    public boolean regist(UserInfo vo) throws Exception {
        int res = this.dao.insert(vo);
        if(res > 0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public UserInfo login(String username, String password) throws Exception {
        UserInfo vo = this.dao.login(username,password,"");
        return vo;
    }
}
