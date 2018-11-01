package com.foodregulation.dao.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.foodregulation.dao.entity.Report;

public interface ReportMapper {

    List<Report> selectReport(Map<String, Object> map);


    int deleteReport(Integer reportId);


    int insertReport(Report record);


    Report findReport(Integer reportId);


    int updateReport(Report record);


    int selectReportTotal(Map<String, Object> map);


    List<Map<String, Object>> reportAreaStatistics(@Param("address") String address, @Param("reportTypeId") String reportTypeId,
            @Param("startTime") Date startTime, @Param("endTime") Date endTime);


    List<Map<String, Object>> reportTypeStatistics(@Param("address") String address, @Param("reportTypeId") String reportTypeId,
            @Param("startTime") Date startTime, @Param("endTime") Date endTime);


    List<Map<String, Object>> reportUnitStatistics(@Param("address") String address, @Param("reportTypeId") String reportTypeId,
            @Param("startTime") Date startTime, @Param("endTime") Date endTime);



    Report findReportDetail(String reportCompany);


    Report getReport(Map<String, Object> param);


    List<Report> getReportList(Map<String, Object> param);


    int updateReportStatus(String reportId);
}
