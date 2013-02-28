package com.friend.study.system.mapper;

import com.friend.base.interfaces.IDAO;
import com.friend.study.system.model.Menus;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-2
 * Time: 下午2:37
 * To change this template use File | Settings | File Templates.
 */
public interface IMenuMapper extends IDAO<Menus,Integer> {
    /**
     * 增加一条记录
     *
     * @param vo 数据对象
     * @return 数据主键值
     * @throws Exception 抛出错误异常
     */
    @Override
    @Insert("INSERT INTO T_MENU(showtext,url,attrs,iconcls,pid,updatets,cangrant) VALUES(#{showText},#{url},#{attrs},#{iconCls},#{pid},current_date,#{cangrant})")
    Integer insert(Menus vo) throws Exception;

    @Override
    @Delete("DELETE FROM T_MENU WHERE mid=#{mid}")
    int delete(Map<String, Object> param) throws Exception;

    @Override
    int update(Map<String, Object> param) throws Exception;

    @Override
    Menus findByPK(Integer integer) throws Exception;

//    @Override
//    @Select("SELECT * FROM T_MENU WHERE 1=1 limit #{pageSize} offset #{offset}")
//    List<Menus> search(int pageSize, int offset, Map<String, Object> map) throws Exception;

    @Override
    @Select("SELECT * FROM T_MENU")
    List<Menus> search(Map<String, Object> map) throws Exception;

    @Override
    int count(Map<String, Object> map) throws Exception;
}
