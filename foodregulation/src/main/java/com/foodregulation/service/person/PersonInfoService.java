package com.foodregulation.service.person;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.PersonInfo;
import com.foodregulation.dao.entity.User;

public interface PersonInfoService {
	
	List<PersonInfo> selectPersonInfo(Map<String, Object> map);
	
    int deletePersonInfo(Integer personId,Integer id);
    
    int insertPersonInfo(PersonInfo record,User user);

    PersonInfo findPersonInfo(Integer personId);

    PersonInfo findPersonByName(String username);

    int updatePersonInfo(PersonInfo record,User user);
    
    int selectPersonInfoTotal(Map<String, Object> map);
    
    List<PersonInfo> findPersonByParams(Map<String,Object> map);
}
