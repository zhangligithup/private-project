package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.Criculate;

public interface CriculateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Criculate record);

    int insertSelective(Criculate record);

    Criculate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Criculate record);

    int updateByPrimaryKey(Criculate record);
}