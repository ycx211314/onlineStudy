package com.friend.base.util;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-1-23
 * Time: 下午2:18
 * To change this template use File | Settings | File Templates.
 */
public class Page<T> {
    /**
     * 页容量
     */
    private int rows = 0;
    /**
     * 页码
     */
    private int page = 0;
    /**
     * 结果集合
     */
    private List<T> res = null;
    /**
     * 分页用，总记录数
     */
    private int total = 0;
    /**
     * 排序字段，前缀 “-”表示降序
     */
    private String sort;

    public Page(int rows, int page) {
        this.rows = rows;
        this.page = page;
    }

    public Page(int rows, int page, String sort) {
        this.rows = rows;
        this.page = page;
        this.sort = sort;
    }
    // Gatter and Setter
    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public List<T> getRes() {
        return res;
    }

    public void setRes(List<T> res) {
        this.res = res;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }
}
