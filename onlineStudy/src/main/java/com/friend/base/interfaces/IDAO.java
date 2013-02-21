package com.friend.base.interfaces;

import com.friend.base.util.Page;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-1-23
 * Time: 下午2:07
 * To change this template use File | Settings | File Templates.
 */
public interface IDAO<T,PK extends Serializable> {
    /**
     * 增加一条记录
     * @param vo  数据对象
     * @return   数据主键值
     * @throws Exception  抛出错误异常
     */
    public PK insert(T vo)throws Exception;

    public int delete(Map<String,Object> param)throws Exception;

    public int update(Map<String,Object> param)throws Exception;

    public T findByPK(PK pk)throws  Exception;

    public List<T> search(int pageSize,int page,Map<String,Object> map)throws Exception;

    public List<T> search(Map<String,Object> map)throws Exception;

    public int count(Map<String,Object>map)throws Exception;

}
