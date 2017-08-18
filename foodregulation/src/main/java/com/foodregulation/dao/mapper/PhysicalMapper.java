package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.Physical;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface PhysicalMapper {
	
    int deleteByPrimaryKey(Long id);
    
    int deleteEnUserByUserName(@Param("userName")String userName);

    int insert(Physical record);

    int insertSelective(Physical record);

    Physical selectByPrimaryKey(Long id);

    long selectPhysicalTotal(Map<String,Object> map);

    List<Physical> selectPhysical(Map<String,Object> map);

    int updateByPrimaryKeySelective(Physical record);

    int updateByPrimaryKey(Physical record);
}