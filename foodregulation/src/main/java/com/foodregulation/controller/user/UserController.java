package com.foodregulation.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.dao.entity.User;
import com.foodregulation.service.user.UserService;

/**
 * 用户信息
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;


    /**
     * 用户信息修改
     */
    @RequestMapping("/updatePassword")
    @ResponseBody
    public int updatePassword(HttpServletRequest request, User record) {
        int num = userService.updatePassword(record);
        if (num > 0) {
            return num;
        } else {
            return num;
        }
    }


    /**
     * 用户信息修改
     */
    @RequestMapping("/validateUser")
    @ResponseBody
    public int validateUser(HttpServletRequest request, User record) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("username", request.getParameter("username"));
        params.put("password", request.getParameter("password"));
        int num = userService.validateUser(params);
        return num;
    }


    @RequestMapping("addUserMenu")
    @ResponseBody
    public boolean addUserMenu(Integer userId, String menus) {
        return userService.addUserMenu(userId, menus);
    }

}
