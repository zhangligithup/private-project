package com.foodregulation.serviceImpl.notification;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.EnterpriseUser;
import com.foodregulation.dao.entity.Notification;
import com.foodregulation.dao.mapper.DictionaryMapper;
import com.foodregulation.dao.mapper.EnterpriseUserMapper;
import com.foodregulation.dao.mapper.NotificationMapper;
import com.foodregulation.dao.mapper.PersonInfoMapper;
import com.foodregulation.service.notification.NotificationService;
import com.foodregulation.util.StringUtils;

import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.admin.service.AdminService;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	NotificationMapper notificationMapper;
	@Autowired
	DictionaryMapper dictionaryMapper;
	@Autowired
	PersonInfoMapper personInfoMapper;
	@Autowired
	EnterpriseUserMapper enterpriseUserMapper;
	
	AdminService adminService = new AdminService();
	
	@Override
	public int insert(Notification record) {
		return notificationMapper.insertSelective(record);
	}
	@Override
	public List<Notification> selectByParam(Map<String, Object> map) {
		return notificationMapper.selectByParam(map);
	}
	
	@Override
	public int deleteNotification(Integer id) {
		return notificationMapper.deleteNotification(id);
	}
	
	@Override
	public Notification findNotification(Integer id) {	
		Notification notification = notificationMapper.findNotification(id);
		return notification;
	}
	
	@Override
	public int selectNotificationTotal(Map<String, Object> map) {
		return notificationMapper.selectNotificationTotal(map);
	}
	
	@Override
	public List<Notification> selectNotificationApp(String username) {
		
		EnterpriseUser enterpriseUser = enterpriseUserMapper.selectEnterpriseUserByUsername(username);
		
		Map<String,Object> map = new HashMap<String,Object>();
		List<Notification> list = null;
		
		if(enterpriseUser!=null && StringUtils.isNotBlank(enterpriseUser.getEnterpriseTypeCode())) {
			map.put("toCode",enterpriseUser.getEnterpriseTypeCode());
			list = notificationMapper.selectByParamApp(map);
			return list;
		}
		Admin admin = adminService.query(username,"");
		if(admin!=null&&StringUtils.isNotBlank(admin.getUnitCode())){
			map.put("toCode",admin.getUnitCode());
			list = notificationMapper.selectByParamApp(map);
			return list;
		}
		
		
		return list;
	}

}
