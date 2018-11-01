package com.foodregulation.dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.foodregulation.dao.entity.EnterpriseUser;

public interface EnterpriseUserMapper {
    int insert(EnterpriseUser record);

    int insertSelective(EnterpriseUser record);
    
    EnterpriseUser findEnterpriseUser(Map<String,Object> param);
    
    EnterpriseUser findEnterpriseUserById(@Param("id")int id);
    
    EnterpriseUser selectEnterpriseUserByUsername(@Param("userName")String userName);
    
    int updateEnterpriseByUsername(@Param("enterpriseName")String enterpriseName,@Param("userName")String userName);
}