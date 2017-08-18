package com.foodregulation.service.map;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.AppUserLocation;

public interface MapService {
	List<AppUserLocation> getNowLocation(Map<String,Object> param);
}
