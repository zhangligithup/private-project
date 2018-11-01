package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.CaseFrom;

public interface CaseFromMapper {
	
	List<CaseFrom> selectCaseFrom(Map<String, Object> map);
	
	int selectCaseFromTotal();
	
    int deleteCaseFrom(Integer caseFromId);

    int insertCaseFrom(CaseFrom record);

    CaseFrom findCaseFrom(Integer caseFromId);

    int updateCaseFrom(CaseFrom record);
    
}