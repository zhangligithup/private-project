package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.ExamRecord;

import java.util.List;

public interface ExamRecordMapper {
    int insertList(List<ExamRecord> records);
}