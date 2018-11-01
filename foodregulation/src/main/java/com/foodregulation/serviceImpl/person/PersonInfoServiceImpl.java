package com.foodregulation.serviceImpl.person;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.PersonInfo;
import com.foodregulation.dao.entity.User;
import com.foodregulation.dao.mapper.PersonInfoMapper;
import com.foodregulation.dao.mapper.UserMapper;
import com.foodregulation.service.person.PersonInfoService;

@Service("personInfoService")
public class PersonInfoServiceImpl implements PersonInfoService{
	
	@Autowired
	PersonInfoMapper personInfoMapper;
	@Autowired
	UserMapper userMapper;

	@Override
	public List<PersonInfo> selectPersonInfo(Map<String, Object> map) {
		return personInfoMapper.selectPersonInfo(map);
	}

	@Override
	public int deletePersonInfo(Integer personId,Integer id) {
		if(id!=null&&!id.equals("")){			
			userMapper.deleteUser(id);
		}
		return personInfoMapper.deletePersonInfo(personId);
	}

	@Override
	public int insertPersonInfo(PersonInfo record,User user) {
		try{
			int num = personInfoMapper.insertPersonInfo(record);
			if(num>0){
				num = userMapper.insertUser(user);
			}
			return num;
		}catch(Exception e){
			return 0;
		}
	}

	@Override
	public PersonInfo findPersonInfo(Integer personId) {
		return personInfoMapper.findPersonInfo(personId);
	}

    @Override
    public PersonInfo findPersonByName(String username) {
        return personInfoMapper.findPersonByName(username);
    }

    @Override
	public int updatePersonInfo(PersonInfo record,User user) {
		if(user.getId()!=null&&!user.getId().equals("")){
			if(user.getUsername()!=null&&!user.getUsername().equals("")){			
				userMapper.updateUser(user);
			}
		}else{
			if(user.getUsername()!=null&&!user.getUsername().equals("")){			
				userMapper.insertUser(user);
			}
		}
		return personInfoMapper.updatePersonInfo(record);
	}

	@Override
	public int selectPersonInfoTotal(Map<String, Object> map) {
		return personInfoMapper.selectPersonInfoTotal(map);
	}

	@Override
	public List<PersonInfo> findPersonByParams(Map<String, Object> map) {
		return personInfoMapper.findPersonByParams(map);
	}

	
}
