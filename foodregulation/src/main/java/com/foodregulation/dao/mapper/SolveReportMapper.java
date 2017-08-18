package com.foodregulation.dao.mapper;


import com.foodregulation.dao.entity.SolveReport;

public interface SolveReportMapper {
    int deleteByPrimaryKey(Long solveReportId);

    int insert(SolveReport record);

    int insertSelective(SolveReport record);

    SolveReport selectByPrimaryKey(Long solveReportId);

    int updateByPrimaryKeySelective(SolveReport record);

    int updateByPrimaryKey(SolveReport record);
    
    SolveReport findHandleReport(String reportId);
    
    int deleteHandleReport(String reportId);
}