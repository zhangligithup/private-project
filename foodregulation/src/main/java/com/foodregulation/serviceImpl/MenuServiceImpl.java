package com.foodregulation.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.LevenOneMenu;
import com.foodregulation.dao.mapper.MenuMapper;
import com.foodregulation.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    MenuMapper menuMapper;


    @Override
    public List<Map<String, String>> getMenu() {
        return menuMapper.getMenu();
    }


    @Override
    public List<LevenOneMenu> getMenuByIds(List<String> list) {
        return menuMapper.getMenuByIds(list);
    }

}
