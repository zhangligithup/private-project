package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.Cosmetic;

public interface CosmeticMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cosmetic record);

    int insertSelective(Cosmetic record);

    Cosmetic selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cosmetic record);

    int updateByPrimaryKey(Cosmetic record);
}