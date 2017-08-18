package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.foodregulation.dao.entity.LevenOneMenu;


public interface MenuMapper {

    public List<Map<String, String>> getMenu();




    public List<LevenOneMenu> getMenuByIds(@Param("list") List<String> list);
}
