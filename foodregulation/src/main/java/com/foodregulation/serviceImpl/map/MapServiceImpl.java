package com.foodregulation.serviceImpl.map;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.AppUserLocation;
import com.foodregulation.dao.mapper.AppUserLocationMapper;
import com.foodregulation.service.map.MapService;

@Service
public class MapServiceImpl implements MapService {

	@ Autowired
	AppUserLocationMapper appUserLocationMapper;
	@Override
	public List<AppUserLocation> getNowLocation(Map<String,Object> param) {
		return appUserLocationMapper.getNowLocation(param);
	}

}
