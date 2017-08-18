package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.Usemed;

public interface UsemedMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Usemed record);

    int insertSelective(Usemed record);

    Usemed selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Usemed record);

    int updateByPrimaryKey(Usemed record);
}