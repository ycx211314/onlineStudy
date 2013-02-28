package com.friend.study.exam.service;

import com.friend.study.exam.model.Subject;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-21
 * Time: 下午4:06
 * To change this template use File | Settings | File Templates.
 */
public interface IExamService {

    public List<Subject> findSubject(Integer papgerId) throws Exception;
}
