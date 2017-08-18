package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.ExamPublish;

public interface ExamPublishMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ExamPublish record);

    int insertSelective(ExamPublish record);

    ExamPublish selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ExamPublish record);

    int updateByPrimaryKey(ExamPublish record);

    int existPublish(ExamPublish record);
}