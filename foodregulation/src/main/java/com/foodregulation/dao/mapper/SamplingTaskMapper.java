package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.SamplingTask;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SamplingTaskMapper {
    int insertList(@Param("list") List<SamplingTask> list);

    int deleteByPrimaryKey(Long id);

    List<Map<String,Object>> findSampTaskList(Map<String,Object> map);

    long findSampTaskListTotal(Map<String,Object> map);
}