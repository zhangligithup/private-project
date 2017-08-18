package com.foodregulation.service.administrative;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.CaseInfo;

public interface CaseInfoService {
	
	List<CaseInfo> selectCaseInfo(Map<String, Object> map);
	
    int deleteCaseInfo(Integer caseInfoId);

    int insertCaseInfo(CaseInfo record);

    CaseInfo findCaseInfo(Integer caseInfoId);

    int updateCaseInfo(CaseInfo record);
    
    int selectCaseInfoTotal(Map<String, Object> params);
}
