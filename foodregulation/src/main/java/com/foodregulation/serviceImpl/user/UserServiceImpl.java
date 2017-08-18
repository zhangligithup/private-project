package com.foodregulation.serviceImpl.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.User;
import com.foodregulation.dao.mapper.UserMapper;
import com.foodregulation.service.user.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;


    @Override
    public int deleteUser(Integer id) {
        return userMapper.deleteUser(id);
    }


    @Override
    public int insertUser(User record) {
        return userMapper.insertUser(record);
    }


    @Override
    public User findUser(Integer id) {
        return userMapper.findUser(id);
    }

    @Override
    public User findUserByName(String username) {
        return userMapper.findUserByName(username);
    }


    @Override
    public int updateUser(User record) {
        return userMapper.updateUser(record);
    }


    @Override
    public int validateUser(Map<String, Object> map) {
        return userMapper.validateUser(map);
    }


    @Override
    public int updatePassword(User record) {
        return userMapper.updatePassword(record);
    }


    @Override
    public boolean addUserMenu(Integer userId, String menus) {
        return userMapper.addUserMenu(userId, menus) > 0 ? true : false;
    }



}
