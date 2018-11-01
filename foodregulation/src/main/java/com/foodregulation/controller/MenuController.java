package com.foodregulation.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tslanpu.test.admin.domain.Admin;

import com.foodregulation.dao.entity.LevenOneMenu;
import com.foodregulation.dao.entity.User;
import com.foodregulation.service.MenuService;
import com.foodregulation.service.user.UserService;

@Controller
@RequestMapping("menu")
public class MenuController {

    @Autowired
    MenuService menuService;

    @Autowired
    UserService userService;


    @RequestMapping("getMenu")
    @ResponseBody
    public List<Map<String, String>> getMenu(HttpServletRequest request, Integer userId) {
        User findUser = userService.findUser(userId);
        String menuIds = findUser.getMenuIds();
        List<String> list = new ArrayList<String>();
        if (StringUtils.isNotEmpty(menuIds)) {
            String[] strs = menuIds.split(",");
            list = Arrays.asList(strs);
        }
        List<Map<String, String>> menus = menuService.getMenu();
        for (int i = 0; i < menus.size(); i++) {
            Map<String, String> map = menus.get(i);
            String str = map.get("id");
            if (list.contains(str)) {
                map.put("checked", "true");
            }
        }
        return menus;
    }


    @RequestMapping("getUserMenu")
    @ResponseBody
    public List<LevenOneMenu> getUserMenu(HttpServletRequest request) {
        List<LevenOneMenu> menus = new ArrayList<LevenOneMenu>();
        Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");
        String menuIds = admin.getMenuIds();
        if (StringUtils.isNotEmpty(menuIds)) {
            String[] strs = menuIds.split(",");
            List<String> list = Arrays.asList(strs);
            menus = menuService.getMenuByIds(list);
        }
        return menus;
    }
}
