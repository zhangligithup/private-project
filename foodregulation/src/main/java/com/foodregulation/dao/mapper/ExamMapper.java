package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.Exam;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ExamMapper {
    int deleteByPrimaryKey(@Param("ids")String ids);

    int insert(Exam record);

    int insertSelective(Exam record);

    Exam selectByPrimaryKey(Long id);

    long selectExamTotal(Map<String,Object> map);

    List<Exam> selectExam(Map<String,Object> map);

    int updateByPrimaryKeySelective(Exam record);

    int updateByPrimaryKeyWithBLOBs(Exam record);

    int updateByPrimaryKey(Exam record);

    List<Long> selectExamRand(Map<String,Object> map);
}