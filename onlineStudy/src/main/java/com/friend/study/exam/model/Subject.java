package com.friend.study.exam.model;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-21
 * Time: 下午1:24
 * To change this template use File | Settings | File Templates.
 */

import java.util.Date;
import java.util.List;

/**
 * 题干信息
 */
public class Subject {
    private Integer sId;
    /**
     * 题目描述
     */
    private String titleDesc;
    /**
     * 关键字
     */
    private String keyworkds;
    /**
     * 题目类型
     */
    private Integer types;
    /**
     * 所属科目
     */
    private Integer branchId;
    /**
     * 图标信息
     */
    private String imgurl;
    /**
     * 标准答案
     */
    private String standAnswer;
    /**
     * 分析新
     */
    private String ananlysisText;

    private Date createTs;
    private Date updateTs;
    private String creator;

    private List<AnswerOpt> answerList;

    public Subject(){}
    public Subject(Integer pk){this.sId = pk;}

    public Integer getsId() {
        return sId;
    }

    public String getTitleDesc() {
        return titleDesc;
    }

    public String getKeyworkds() {
        return keyworkds;
    }

    public Integer getTypes() {
        return types;
    }

    public Integer getBranchId() {
        return branchId;
    }

    public String getImgurl() {
        return imgurl;
    }

    public String getStandAnswer() {
        return standAnswer;
    }

    public String getAnanlysisText() {
        return ananlysisText;
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

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public void setTitleDesc(String titleDesc) {
        this.titleDesc = titleDesc;
    }

    public void setKeyworkds(String keyworkds) {
        this.keyworkds = keyworkds;
    }

    public void setTypes(Integer types) {
        this.types = types;
    }

    public void setBranchId(Integer branchId) {
        this.branchId = branchId;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public void setStandAnswer(String standAnswer) {
        this.standAnswer = standAnswer;
    }

    public void setAnanlysisText(String ananlysisText) {
        this.ananlysisText = ananlysisText;
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

    public List<AnswerOpt> getAnswerList() {
        return answerList;
    }

    public void setAnswerList(List<AnswerOpt> answerList) {
        this.answerList = answerList;
    }
}
