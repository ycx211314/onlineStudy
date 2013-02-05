package study.system.dao;

import com.friend.study.system.model.UserInfo;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created with IntelliJ IDEA.
 * User: Prince
 * Date: 13-1-23
 * Time: 下午9:24
 * To change this template use File | Settings | File Templates.
 */
public class TestUserInfoDAO {
    private ApplicationContext context;
    @Before
    public void init(){
          this.context=new ClassPathXmlApplicationContext("applicationContext.xml");
    }
    @Test
    @Transactional(propagation = Propagation.REQUIRED)
    public void insert(){
        UserInfo vo = new UserInfo();
        vo.setNeckName("一堆一堆");
        vo.setEmail("ycx211314@dsss.com");
        vo.setPassword("123123");
        vo.setUserName("ycx21fd1314");
        try{
            assert(0 > 0);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
