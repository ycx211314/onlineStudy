package com.friend.study.system.service.impl;

import com.friend.study.system.mapper.IMenuMapper;
import com.friend.study.system.mapper.IUserInfoMapper;
import com.friend.study.system.model.Menus;
import com.friend.study.system.service.IMenuService;
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
 * Date: 13-2-17
 * Time: 上午10:53
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MenuServiceImpl implements IMenuService {
    private IMenuMapper mapper;
    @Resource
    public void setMapper(SqlSessionTemplate template){
        mapper = template.getMapper(IMenuMapper.class);
    }
    @Override
    public boolean addMenu(Menus vo) throws Exception {
        int res = this.mapper.insert(vo);
        if(res > 0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public List<Menus> findAll() throws Exception {
        return this.mapper.search(new HashMap<String, Object>());
    }

    @Override
    public boolean remove(Integer mid) throws Exception {
        Map<String,Object> pararm = new HashMap<String,Object>();
        pararm.put("mid",mid);
       int res = this.mapper.delete(pararm);
        if(res > 0 ){
            return true;
        }else{
            return false;
        }
    }
}
