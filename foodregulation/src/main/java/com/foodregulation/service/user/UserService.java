package com.foodregulation.service.user;

import java.util.Map;

import com.foodregulation.dao.entity.User;

public interface UserService {

    int deleteUser(Integer id);


    int insertUser(User record);


    User findUser(Integer id);

    User findUserByName(String username);

    int updateUser(User record);


    int validateUser(Map<String, Object> map);


    int updatePassword(User record);


    boolean addUserMenu(Integer userId, String menus);

}
