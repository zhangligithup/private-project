package com.foodregulation.service;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.LevenOneMenu;


public interface MenuService {

    public List<Map<String, String>> getMenu();


    public List<LevenOneMenu> getMenuByIds(List<String> list);
}
