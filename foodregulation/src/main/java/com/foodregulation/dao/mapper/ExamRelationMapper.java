package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.ExamRelation;

import java.util.List;

public interface ExamRelationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ExamRelation record);

    int insertList(List<ExamRelation> examRelations);

    int insertSelective(ExamRelation record);

    ExamRelation selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ExamRelation record);

    int updateByPrimaryKey(ExamRelation record);

    int findTotalExam(Long examinationId);
}