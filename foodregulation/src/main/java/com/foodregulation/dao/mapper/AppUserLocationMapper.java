package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.foodregulation.dao.entity.AppUserLocation;

public interface AppUserLocationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AppUserLocation record);

    int insertSelective(AppUserLocation record);

    AppUserLocation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AppUserLocation record);

    int updateByPrimaryKey(AppUserLocation record);
    
    List<AppUserLocation> getNowLocation(Map<String,Object> param);
}