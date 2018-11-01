package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.PersonInfo;
import org.apache.ibatis.annotations.Param;

public interface PersonInfoMapper {
	
	List<PersonInfo> selectPersonInfo(Map<String, Object> map);
	
    int deletePersonInfo(Integer personId);
    
    int insertPersonInfo(PersonInfo record);

    PersonInfo findPersonInfo(Integer personId);

    PersonInfo findPersonByName(@Param("username") String username);
    
    List<PersonInfo> findPersonByParams(Map<String,Object> map);

    int updatePersonInfo(PersonInfo record);
    
    int selectPersonInfoTotal(Map<String, Object> map);
}
