package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.Production;

public interface ProductionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Production record);

    int insertSelective(Production record);

    Production selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Production record);

    int updateByPrimaryKey(Production record);
}