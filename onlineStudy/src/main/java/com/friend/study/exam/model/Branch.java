package com.friend.study.exam.model;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-21
 * Time: 下午3:23
 * To change this template use File | Settings | File Templates.
 */
public class Branch {
    private Integer bid;
    /**
     * 科目类型
     */
    private Integer categroy;
    /**
     * 显示文本
     */
    private String displayText;
    /**
     * 科目描述
     */
    private String description;
    /**
     * 依赖科目
     */
    private String depandOn;
    /**
     * 创建时间
     */
    private Date createTs;
    /**
     * 更新时间
     */
    private Date updateTs;
    /**
     * 创建者
     */
    private String creator;

    public Branch(){}
    public Branch(Integer pk){this.bid=pk;}
    /***
     * get and setter
     */
    public Integer getBid() {
        return bid;
    }

    public Integer getCategroy() {
        return categroy;
    }

    public String getDisplayText() {
        return displayText;
    }

    public String getDescription() {
        return description;
    }

    public String getDepandOn() {
        return depandOn;
    }

    public Date getCreateTs() {
        return createTs;
    }

    public Date getUpdateTs() {
        return updateTs;
    }

    public String getCreator() {
        return creator;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public void setCategroy(Integer categroy) {
        this.categroy = categroy;
    }

    public void setDisplayText(String displayText) {
        this.displayText = displayText;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDepandOn(String depandOn) {
        this.depandOn = depandOn;
    }

    public void setCreateTs(Date createTs) {
        this.createTs = createTs;
    }

    public void setUpdateTs(Date updateTs) {
        this.updateTs = updateTs;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }
}
