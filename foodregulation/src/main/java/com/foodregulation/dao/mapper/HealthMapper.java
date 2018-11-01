package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.Health;

public interface HealthMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Health record);

    int insertSelective(Health record);

    Health selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Health record);

    int updateByPrimaryKey(Health record);
}