package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.Medical;

public interface MedicalMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Medical record);

    int insertSelective(Medical record);

    Medical selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Medical record);

    int updateByPrimaryKey(Medical record);
}