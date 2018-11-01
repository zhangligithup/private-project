package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.AdditiveFiling;

public interface AdditiveFilingMapper {

	List<AdditiveFiling> selectAdditiveFiling(Map<String, Object> map);
	
	int selectAdditiveFilingTotal(Map<String, Object> map);
	
    int deleteAdditiveFiling(Integer id);

    int insertAdditiveFiling(AdditiveFiling record);

    AdditiveFiling findAdditiveFiling(Integer id);

    int updateAdditiveFiling(AdditiveFiling record);
    
}