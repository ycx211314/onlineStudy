package com.friend.study.system.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-2
 * Time: 上午9:27
 * To change this template use File | Settings | File Templates.
 */
public class Menus implements Serializable {
    /**
     * 主键编号
     */
    private Integer mid;
    /**
     * 文本信息
     */
    private String showText;
    /**
     * 路径
     */
    private String url;
    /**
     * 属性
     */
    private String attrs;
    /**
     * 图标
     */
    private String iconCls;
    /**
     * 上级PID
     */
    private Integer pid;
    /**
     * 更新时间
     */
    private Date updateTs;
    /**
     * 能否被授权
     */
    private Boolean cangrant;
    //Construction
    public Menus(){}
    public Menus(Integer mid) {
        this.mid = mid;
    }
    //getter and setter

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getShowText() {
        return showText;
    }

    public void setShowText(String showText) {
        this.showText = showText;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getAttrs() {
        return attrs;
    }

    public void setAttrs(String attrs) {
        this.attrs = attrs;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Date getUpdateTs() {
        return updateTs;
    }

    public void setUpdateTs(Date updateTs) {
        this.updateTs = updateTs;
    }

    public Boolean getCangrant() {
        return cangrant;
    }

    public void setCangrant(Boolean cangrant) {
        this.cangrant = cangrant;
    }
}
