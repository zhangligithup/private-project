package com.foodregulation.serviceImpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.mapper.CommonMapper;
import com.foodregulation.service.CommonService;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	CommonMapper commonMapper;

	@Override
	public int selectDataCount(Map<String, Object> params) {
		return commonMapper.selectDataCount(params);
	}
	

}
