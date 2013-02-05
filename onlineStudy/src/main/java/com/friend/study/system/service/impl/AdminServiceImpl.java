package com.friend.study.system.service.impl;

import com.friend.study.system.mapper.IMenuMapper;
import com.friend.study.system.model.Administartor;
import com.friend.study.system.model.Menus;
import com.friend.study.system.service.IAdminService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-1-31
 * Time: 下午4:06
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class AdminServiceImpl implements IAdminService {

    private IMenuMapper menuMapper;
    @Resource
    public void setMapper(SqlSessionTemplate template){
        menuMapper = template.getMapper(IMenuMapper.class);
    }
    /**
     * 管理员登录
     *
     * @param username
     * @param password
     * @return
     * @throws Exception
     */
    @Override
    public Administartor login(String username, String password) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Map<String, Object> findLoginInfomation(String username) throws Exception {
        Map<String,Object> result = new HashMap<String, Object>();
        Map<String,Object> param = new HashMap<String, Object>();
        List<Menus> menus = menuMapper.search(10, 0, param);
        result.put("menu",menus);
        return result;
    }
}
