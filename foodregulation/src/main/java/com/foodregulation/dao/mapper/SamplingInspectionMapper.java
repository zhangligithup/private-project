package com.foodregulation.dao.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.foodregulation.dao.entity.AppSamplingInspection;
import com.foodregulation.dao.entity.SamplingInspection;

public interface SamplingInspectionMapper {

    int deleteByPrimaryKey(Long id);


    int insert(SamplingInspection record);


    SamplingInspection selectByPrimaryKey(Long id);


    int updateByPrimaryKeySelective(SamplingInspection record);



    List<SamplingInspection> getSamplingInspectionList(@Param("samplingInspection") SamplingInspection record, @Param("pageIndex") Integer pageIndex,
            @Param("pageSize") Integer pageSize);


    Integer getSamplingInspectionListCount(@Param("samplingInspection") SamplingInspection record);


    List<Map<String, Object>> samplingStatistics(@Param("startTime") Date startTime, @Param("endTime") Date endTime, @Param("result") String result);


    List<Map<String, Object>> samplingUnitStatistics(@Param("startTime") Date startTime, @Param("endTime") Date endTime, @Param("result") String result);


    SamplingInspection getSamplingInspection(Map<String, Object> param);
}
