package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.ExamRecord;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ExamRecordMapper {
    int insertList(List<ExamRecord> records);

    int deleteRecord(@Param("examinationId") String paramString1, @Param("personId") String paramString2, @Param("type") String paramString3);

    int isAnswerExam(@Param("examinationId") String paramString1, @Param("personId") String paramString2, @Param("type") String paramString3);
}