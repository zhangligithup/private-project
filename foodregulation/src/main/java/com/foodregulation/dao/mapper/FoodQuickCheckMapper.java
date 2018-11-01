package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.foodregulation.dao.entity.FoodQuickCheck;

public interface FoodQuickCheckMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FoodQuickCheck record);

    int insertSelective(FoodQuickCheck record);

    FoodQuickCheck selectByPrimaryKey(Integer id);
    
    List<FoodQuickCheck> selectQuickCheckList(Map<String,Object> parma);
    
    Integer selectQuickCheckListTotal(Map<String,Object> parma);

    int updateByPrimaryKeySelective(FoodQuickCheck record);

    int updateByPrimaryKey(FoodQuickCheck record);
    
    int batchInsert(@Param("dataList")List<FoodQuickCheck> dataList);
}