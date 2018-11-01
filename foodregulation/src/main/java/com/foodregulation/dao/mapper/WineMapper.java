package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.Wine;

public interface WineMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Wine record);

    int insertSelective(Wine record);

    Wine selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Wine record);

    int updateByPrimaryKey(Wine record);
}