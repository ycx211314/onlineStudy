package study.system.service;

import com.friend.study.system.service.IAdminService;
import org.apache.ibatis.transaction.Transaction;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-2
 * Time: 下午3:20
 * To change this template use File | Settings | File Templates.
 */
public class AdminServiceImplTest {
    private ApplicationContext context;
    @Before
    public void init(){
        this.context=new ClassPathXmlApplicationContext("applicationContext.xml");
    }
    @Test
    @Transactional(propagation = Propagation.REQUIRED)
    public void findLoginInfomationTest(){
        IAdminService service = context.getBean(IAdminService.class);
        try{
            Map<String,Object> maps = service.findLoginInfomation("");
            System.out.print(maps);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
