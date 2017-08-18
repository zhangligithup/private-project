package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.Notification;

public interface NotificationMapper {
    int deleteNotification(Integer id);

    int insert(Notification record);

    int insertSelective(Notification record);

    Notification findNotification(Integer id);

    int updateNotification(Notification record);
    
    List<Notification> selectByParam(Map<String,Object> map);
    
    List<Notification> selectByParamApp(Map<String,Object> map);
    
    int selectNotificationTotal(Map<String,Object> map);
}