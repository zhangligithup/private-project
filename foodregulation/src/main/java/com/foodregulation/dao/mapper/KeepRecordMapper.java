package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.KeepRecord;

public interface KeepRecordMapper {
	
	List<KeepRecord> selectKeepRecord(Map<String, Object> map);
	
	int selectKeepRecordTotal(Map<String, Object> map);
	
    int deleteKeepRecord(Integer id);

    int insertKeepRecord(KeepRecord record);

    KeepRecord findKeepRecord(Integer id);

    int updateKeepRecord(KeepRecord record);
    
}