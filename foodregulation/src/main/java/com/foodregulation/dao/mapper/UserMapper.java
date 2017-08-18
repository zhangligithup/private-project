package com.foodregulation.dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.foodregulation.dao.entity.User;

public interface UserMapper {

    int deleteUser(Integer id);


    int insertUser(User record);


    User findUser(Integer id);


    int updateUser(User record);


    int validateUser(Map<String, Object> map);

    User findUserByName(String username);

    int updatePassword(User record);


    User userLogin(Map<String, Object> param);


    int addUserMenu(@Param("userId") Integer userId, @Param("menus") String menus);

}
