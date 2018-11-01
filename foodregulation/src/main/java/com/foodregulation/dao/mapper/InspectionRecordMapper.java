package com.foodregulation.dao.mapper;

import java.util.Map;

import com.foodregulation.dao.entity.InspectionRecord;

public interface InspectionRecordMapper {

	int deleteInspectionRecord(Integer id);

    int insertInspectionRecord(InspectionRecord record);

    InspectionRecord findInspectionRecord(Integer id);

    int updateInspectionRecord(InspectionRecord record);
    
    /**
     * 查询现场检查笔录生成pdf所需数据
     * @param id
     * @return
     */
    Map<String,Object> selectPdfDataById(Integer id);

}