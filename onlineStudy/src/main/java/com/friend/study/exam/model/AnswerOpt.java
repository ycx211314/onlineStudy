package com.friend.study.exam.model;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-21
 * Time: 下午3:47
 * To change this template use File | Settings | File Templates.
 */
public class AnswerOpt {

    private Integer aid;
    private String shwoText;
    private String details;
    private String imgurl;
    private Integer questionId;
    private Date createTs;
    private Date updateTs;
    private String creator;

    public AnswerOpt(){}
    public AnswerOpt(Integer pk){this.aid = pk;}

    public Integer getAid() {
        return aid;
    }

    public String getShwoText() {
        return shwoText;
    }

    public String getDetails() {
        return details;
    }

    public String getImgurl() {
        return imgurl;
    }

    public Integer getQuestionId() {
        return questionId;
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

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public void setShwoText(String shwoText) {
        this.shwoText = shwoText;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
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
