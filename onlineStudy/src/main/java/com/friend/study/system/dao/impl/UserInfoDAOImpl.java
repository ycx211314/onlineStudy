package com.friend.study.system.dao.impl;

import com.friend.study.system.dao.IUserInfoDAO;
import com.friend.study.system.model.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Prince
 * Date: 13-1-20
 * Time: 下午6:23
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class UserInfoDAOImpl implements IUserInfoDAO {
    @Resource(name = "sqlSessionFactory")
    private SqlSessionFactory factory;
    @Override
    public boolean save(UserInfo vo) throws Exception {
        SqlSession session = factory.openSession();
        UserInfo info = new UserInfo();
        info.setUserId(2);
        info.setNeckName("ycx");
        session.insert("UserInfo.saveUser",info);
        session.commit(false);
        session.close();
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<UserInfo> find() throws Exception {
        SqlSession session = factory.openSession();
        List<UserInfo> res= session.selectList("UserInfo.selectUser") ;

        session.close();
        return res;  //To change body of implemented methods use File | Settings | File Templates.
    }

    public void setFactory(SqlSessionFactory factory) {
        this.factory = factory;
    }
}
