package com.foodregulation.service.report;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.Report;

public interface ReportService {

    List<Report> selectReport(Map<String, Object> map);


    int deleteReport(Integer reportId);


    int insertReport(Report record);


    Report findReport(Integer reportId);


    int updateReport(Report record);


    int selectReportTotal(Map<String, Object> map);
}
