package com.friend.study.exam.mapper;

import com.friend.base.interfaces.IDAO;
import com.friend.study.exam.model.AnswerOpt;
import com.friend.study.exam.model.Subject;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-21
 * Time: 下午3:51
 * To change this template use File | Settings | File Templates.
 */
public interface ISubjectMapper extends IDAO<Subject,Integer> {
    /**
     * 增加一条记录
     *
     * @param vo 数据对象
     * @return 数据主键值
     * @throws Exception 抛出错误异常
     */
    @Override
    Integer insert(Subject vo) throws Exception;

    @Override
    int delete(Map<String, Object> param) throws Exception;

    @Override
    int update(Map<String, Object> param) throws Exception;

    @Override
    Subject findByPK(Integer integer) throws Exception;

//    @Override
//    @Select("Select * from t_subject WHERE 1=1 ORDER BY s_id limit #{pageSize} offset #{offset}")
//    @Results(value={
//            @Result(id=true,column="s_id",property="sId"),
//            @Result(column="title_desc",property="titleDesc"),
//            @Result(column="keywords",property="keyworkds"),
//            @Result(column="types",property="types"),
//            @Result(column="branch_id",property="branchId"),
//            @Result(column="stand_answer",property="standAnswer"),
//            @Result(column="analysis_text",property="ananlysisText"),
//            @Result(column="createts",property="createTs"),
//            @Result(column="updatets",property="updateTs"),
//            @Result(column="creator",property="creator")
//    })
//    List<Subject> search(int pageSize, int offset, Map<String, Object> map) throws Exception;

    @Override
    @Select("Select * from t_subject WHERE 1=1 ORDER BY s_id desc limit #{pageSize} offset #{offset}")
    @Results(value = {
            @Result(id=true,column="s_id",property="sId"),
            @Result(column="title_desc",property="titleDesc"),
            @Result(column="keywords",property="keyworkds"),
            @Result(column="types",property="types"),
            @Result(column="branch_id",property="branchId"),
            @Result(column="stand_answer",property="standAnswer"),
            @Result(column="analysis_text",property="ananlysisText"),
            @Result(column="createts",property="createTs"),
            @Result(column="updatets",property="updateTs"),
            @Result(column="creator",property="creator"),
            @Result(property = "answerList",javaType=List.class,column ="s_id",many=@Many(select="getAnswerBySubject"))
    })
    List<Subject> search(Map<String, Object> map) throws Exception;
    @Select("SELECT * FROM t_answer_opt WHERE question_id = #{subid}")
    @Results(value = {
            @Result(id=true,column="aid",property="aid"),
            @Result(column="show_text",property="shwoText"),
            @Result(column="details",property="details"),
            @Result(column="imgurl",property="imgurl"),
            @Result(column="question_id",property="questionId"),
            @Result(column="createts",property="createTs"),
            @Result(column="updatets",property="updateTs")
    })
    List<AnswerOpt> getAnswerBySubject(Integer subid)throws Exception;

    @Override
    int count(Map<String, Object> map) throws Exception;
}
