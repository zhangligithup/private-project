package com.foodregulation.dao.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.foodregulation.dao.entity.SupervisionAndCheck;

public interface SupervisionAndCheckMapper {

    int deleteByPrimaryKey(Integer id);


    int insert(SupervisionAndCheck record);


    int insertSelective(SupervisionAndCheck record);


    SupervisionAndCheck selectByPrimaryKey(Integer id);


    int updateByPrimaryKeySelective(SupervisionAndCheck record);


    int updateByPrimaryKey(SupervisionAndCheck record);


    List<SupervisionAndCheck> selectSupervisionCheck(Map<String, Object> param);


    int selectSupervisionCheckTotal(Map<String, Object> param);


    List<Map<String, Object>> jdjcStatistics(@Param("startTime") Date startTime, @Param("endTime") Date endTime);


    List<Map<String, Object>> jdjcUnitStatistics(@Param("enType") String enType, @Param("startTime") Date startTime, @Param("endTime") Date endTime);


    SupervisionAndCheck findSupervisionAndCheckDetail(String checkedEnterpriseName);


    List<SupervisionAndCheck> getSupervisionAndCheck(Map<String, Object> param);
}
