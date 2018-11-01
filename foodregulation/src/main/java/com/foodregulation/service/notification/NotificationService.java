package com.foodregulation.service.notification;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.Notification;

public interface NotificationService {
	
	/**
	 * 公告新增
	 * @param record
	 * @return
	 */
	int insert(Notification record);
	
	/**
	 *公告查询
	 * @param map
	 * @return
	 */
	List<Notification> selectByParam(Map<String,Object> map);
	
	int deleteNotification(Integer id);
	
	Notification findNotification(Integer id);
	
	int selectNotificationTotal(Map<String,Object> map);
	
	List<Notification> selectNotificationApp(String username);
}
