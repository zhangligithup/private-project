package com.foodregulation.service;

import java.util.Map;

public interface CommonService {
	/**
	 * 查询表中数据的数量
	 * @param params
	 * @return
	 */
    int selectDataCount(Map<String,Object> params);
    
  
}
