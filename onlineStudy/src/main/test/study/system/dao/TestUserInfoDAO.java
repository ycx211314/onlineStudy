package study.system.dao;

import com.friend.study.system.dao.IUserInfoDAO;
import com.friend.study.system.model.UserInfo;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created with IntelliJ IDEA.
 * User: Prince
 * Date: 13-1-23
 * Time: 下午9:24
 * To change this template use File | Settings | File Templates.
 */
public class TestUserInfoDAO {
    private ApplicationContext context;
    private IUserInfoDAO dao;
    @Before
    public void init(){
          this.context=new ClassPathXmlApplicationContext("applicationContext.xml");
        this.dao=this.context.getBean(IUserInfoDAO.class);
    }
    @Test
    public void insert(){
        UserInfo vo = new UserInfo();
        vo.setNeckName("一堆一堆");
        vo.setEmail("ycx211314@ds.com");
        vo.setPassword("123123");
        vo.setUserName("ycx211314");
        try{
            int res = dao.insert(vo);
            assert(res > 0);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
