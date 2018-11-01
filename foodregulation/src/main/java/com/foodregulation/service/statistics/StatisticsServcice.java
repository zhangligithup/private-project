package com.foodregulation.service.statistics;

import java.util.Date;
import java.util.Map;

import org.apache.ibatis.annotations.Param;


public interface StatisticsServcice {

    public Map<String, Integer> enterpriseTypeStatistics(Date startTime, Date endTime);


    public Map<String, Integer> enterpriseAreaStatistics(Date startTime, Date endTime);


    public Map<String, Integer> enterpriseUnitStatistics(Date startTime, Date endTime);


    public Map<String, Integer> jdjcStatistics(Date startTime, Date endTime);


    public Map<String, Integer> jdjcUnitStatistics(String jcrName, Date startTime, Date endTime);


    public Map<String, Integer> samplingStatistics(Date startTime, Date endTime, String result);


    public Map<String, Integer> samplingUnitStatistics(Date startTime, Date endTime, String result);


    public Map<String, Integer> reportAreaStatistics(@Param("address") String address, @Param("reportTypeId") String reportTypeId,
            @Param("startTime") Date startTime, @Param("endTime") Date endTime);


    public Map<String, Integer> reportTypeStatistics(@Param("address") String address, @Param("reportTypeId") String reportTypeId,
            @Param("startTime") Date startTime, @Param("endTime") Date endTime);


    public Map<String, Integer> reportUnitStatistics(String address, String reportTypeId, Date startTime, Date endTime);
}
