package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.Agricultural;

public interface AgriculturalMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Agricultural record);

    int insertSelective(Agricultural record);

    Agricultural selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Agricultural record);

    int updateByPrimaryKey(Agricultural record);
}