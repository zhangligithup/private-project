package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.foodregulation.dao.entity.Dictionary;

public interface DictionaryMapper {

    int deleteByPrimaryKey(Integer id);


    int insert(Dictionary record);


    int insertSelective(Dictionary record);


    Dictionary selectByPrimaryKey(Integer id);


    int updateByPrimaryKeySelective(Dictionary record);


    int updateByPrimaryKey(Dictionary record);


    List<Dictionary> getDictionaryByType(@Param("type")Integer type);


    Dictionary getDictionaryByCode(String tDictionaryCode);


    List<Dictionary> getDictionaryList(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize, @Param("type") Integer type);


    Long getDictionaryListCount(@Param("type") Integer type);
    
    Map<String,Object> selectEnterpriseTypeIdByEnterpriseUserId(@Param("personId")Integer personId);
}
