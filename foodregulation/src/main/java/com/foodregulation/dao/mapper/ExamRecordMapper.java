package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.ExamRecord;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ExamRecordMapper {
    int insertList(List<ExamRecord> records);
    int deleteRecord(@Param("examinationId")String examinationId, @Param("personId") String personId, @Param("type")String type);
    int isAnswerExam(@Param("examinationId")String examinationId, @Param("personId") String personId, @Param("type")String type);
}