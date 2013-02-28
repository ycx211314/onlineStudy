package com.friend.study.exam.service.impl;

import com.friend.study.exam.mapper.ISubjectMapper;
import com.friend.study.exam.model.Subject;
import com.friend.study.exam.service.IExamService;
import com.friend.study.system.mapper.IMenuMapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-21
 * Time: 下午4:09
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ExamServiceImpl implements IExamService {
    private ISubjectMapper mapper;
    @Resource
    public void setMapper(SqlSessionTemplate template){
        mapper = template.getMapper(ISubjectMapper.class);
    }
    @Override
    public List<Subject> findSubject(Integer papgerId) throws Exception {
        Map<String,Object> param = new HashMap<String, Object>();
        param.put("pageSize",20);
        param.put("offset",0);
        List<Subject> res = this.mapper.search(param);
        for (Subject b : res){
              b.getAnswerList().size();
        }
        return this.mapper.search(param);
    }
}
