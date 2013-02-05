package com.friend.study.system.mapper;

import com.friend.base.interfaces.IDAO;
import com.friend.base.util.Page;
import com.friend.study.system.model.UserInfo;
import com.friend.study.system.sqlbuilder.UserInfoProvider;
import org.apache.ibatis.annotations.*;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-1-29
 * Time: 下午2:11
 * To change this template use File | Settings | File Templates.
 */
public interface IUserInfoMapper extends IDAO<UserInfo,Integer>{
    /****************** SQL ***************/
    final String INSERTSQL="INSERT INTO t_userinfo(email, username, passwords, neckname) VALUES(#{email},#{userName},#{password},#{neckName})";
    final String DEL="";
    final String UPDATE="";
    final String SELECTSQL="";
    final String COUNT="";
    final String loginSQL="SELECT userid,neckname,lastlogints,logincookies FROM T_USERINFO WHERE (USERNAME= #{userName} OR EMAIL= #{userName}) AND PASSWORDS = #{password}";

    /**
     * 增加一条记录
     *
     * @param vo 数据对象
     * @return 数据主键值
     * @throws Exception 抛出错误异常
     */
    @Insert(INSERTSQL)
    Integer insert(UserInfo vo) throws Exception;

    @Delete(DEL)
    int delete(Map<String, Object> param) throws Exception;

    @Update(UPDATE)
    int update(Map<String, Object> param) throws Exception;

    @SelectProvider(method ="selectByPk",type = UserInfoProvider.class)
    UserInfo findByPK(Integer pk) throws Exception;

    /**
     * 登录
     *
     * @param loginName 用户名
     * @param loginPwd  密码
     * @param cookies   登录cookies，用于记住登录
     * @return 是否登录成功
     * @throws Exception 出错抛出异常
     */
    @Select("SELECT userid,neckname,lastlogints,logincookies FROM T_USERINFO WHERE (USERNAME= #{userName} OR EMAIL= #{userName}) AND PASSWORDS = #{password}")
    @Results(value = {
            @Result(column ="userid",property ="userId"),
            @Result(column ="neckname",property = "nectName"),
            @Result(column = "lastlogints",property = "lastloginTs") ,
            @Result(column = "logincookies",property = "loginCookies")
    })
    UserInfo login(String loginName, String loginPwd, String cookies) throws Exception;

    /**
     * 第三方登录
     *
     * @param thirdInfo 第三方登录返回信息
     * @param from      来源
     * @return 注册是否成
     * @throws Exception 异常上抛
     */
    int registThird(String thirdInfo, String from) throws Exception;

    /**
     * 检查Email是否已被注册
     * @param code
     * @return
     * @throws Exception
     */
    @Select("SELECT COUNT(*) FROM T_USERINFO WHERE EMAIL = #{code}")
    public int isExsitEmail(String code)throws Exception;

    /**
     * 检查用户名是否存在
     * @param code
     * @return
     * @throws Exception
     */
    @Select("SELECT COUNT(*) FROM T_USERINFO WHERE USERNAME = #{code}")
    public int isExsitUserName(String code)throws Exception;
}
