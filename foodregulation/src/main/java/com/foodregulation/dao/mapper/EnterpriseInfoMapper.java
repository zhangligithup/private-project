package com.foodregulation.dao.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface EnterpriseInfoMapper {

    List<Map<String, Object>> selectEnterpriseInfo(Map<String, Object> param);
    
    List<Map<String, Object>> selectEnterpriseInfoGroupcheckUnit(@Param("enterpriseType")String enterpriseType);

    List<Map<String, Object>> getEnterpriseList(Map<String, Object> param);

    int selectEnterpriseInfoTotal(Map<String, Object> param);

    long getEnterpriseListTotal(Map<String, Object> param);

    List<Map<String, Object>> enterpriseTypeStatistics(@Param("startTime") Date startTime, @Param("endTime") Date endTime);


    List<Map<String, Object>> enterpriseAreaStatistics(@Param("startTime") Date startTime, @Param("endTime") Date endTime);


    List<Map<String, Object>> enterpriseUnitStatistics(@Param("startTime") Date startTime, @Param("endTime") Date endTime);


    Map<String, Object> finEnterpriseInfo(Map<String, Object> param);
    
    List<Map<String, Object>> getEnterpriseNameList(@Param("tableName")String tableName);
    
    List<Map<String, Object>> selectEnterpriseInfoName(Map<String, Object> map);
}
