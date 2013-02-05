package com.friend.study.system.sqlbuilder;
import static org.apache.ibatis.jdbc.SelectBuilder.*;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-1-29
 * Time: 下午4:04
 * To change this template use File | Settings | File Templates.
 */
public class UserInfoProvider {
    public String selectByPk(){
        BEGIN();
        FROM("T_USERINFO");
        WHERE("userId = #{id}");
        return SQL();
    }

    public static void main(String[] args){
        System.out.print(new UserInfoProvider().selectByPk());
    }
}
