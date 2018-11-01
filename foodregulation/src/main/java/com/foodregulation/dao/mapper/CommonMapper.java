package com.foodregulation.dao.mapper;

import java.util.Map;

public interface CommonMapper {
	
	/**
	 * 查询表中数据的数量
	 * @param params
	 * @return
	 */
    int selectDataCount(Map<String,Object> params);
    
    
}
