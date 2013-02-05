package com.friend.study.system.service.impl;

import com.friend.study.system.mapper.IUserInfoMapper;
import com.friend.study.system.model.UserInfo;
import com.friend.study.system.service.IRegistService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.UUID;

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

    private IUserInfoMapper mapper;
    @Resource
    public void setMapper(SqlSessionTemplate template){
        mapper = template.getMapper(IUserInfoMapper.class);
    }

    @Override
    public boolean regist(UserInfo vo) throws Exception {
        int res = mapper.insert(vo);
        if(res > 0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public UserInfo login(String username, String password) throws Exception {
        UserInfo vo = this.mapper.login(username,password,"");
        vo.setPassword(UUID.randomUUID().toString());
        return vo;
    }

    @Override
    public boolean isExsit(String code, int type) throws Exception {
        boolean flag = false;
        switch (type){
            case 1:{
                if(this.mapper.isExsitEmail(code) > 0){
                    flag = true;
                }
                 break;
            }
            case 2:
                if(this .mapper.isExsitUserName(code) > 0){
                    flag = true;
                }
                break;
            default:
                break;
        }
        return flag;
    }
}
