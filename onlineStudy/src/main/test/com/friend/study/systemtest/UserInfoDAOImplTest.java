package com.friend.study.systemtest;

import com.friend.study.system.dao.IUserInfoDAO;
import com.friend.study.system.dao.impl.UserInfoDAOImpl;
import com.friend.study.system.model.UserInfo;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Prince
 * Date: 13-1-20
 * Time: 下午10:45
 * To change this template use File | Settings | File Templates.
 */
public class UserInfoDAOImplTest {

    @Test
    public void testSave(){

        ApplicationContext ctx = new ClassPathXmlApplicationContext("classpath:application-datasource.xml");
        IUserInfoDAO dao=ctx.getBean(IUserInfoDAO.class);
        try{
//           dao.save(new UserInfo());
            List<UserInfo> res = dao.find();

            res.size();
            System.out.print(res);
        }catch (Exception e){
            e.printStackTrace();
        }

        System.out.print("sdfsdfsdfsdf");
    }
}
