package com.friend.study.system.service;

import com.friend.study.system.model.Menus;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-4
 * Time: 上午11:08
 * To change this template use File | Settings | File Templates.
 */
public interface IMenuService {
    public boolean addMenu(Menus vo)throws Exception;

    public List<Menus> findAll()throws Exception;

    public boolean remove(Integer mid) throws Exception;
}
