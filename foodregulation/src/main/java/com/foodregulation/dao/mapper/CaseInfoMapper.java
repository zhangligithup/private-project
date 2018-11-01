package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.CaseInfo;

public interface CaseInfoMapper {
	
	List<CaseInfo> selectCaseInfo(Map<String, Object> map);
	
    int deleteCaseInfo(Integer caseInfoId);

    int insertCaseInfo(CaseInfo record);

    CaseInfo findCaseInfo(Integer caseInfoId);

    int updateCaseInfo(CaseInfo record);
    
    int selectCaseInfoTotal(Map<String, Object> params);
    
    List<CaseInfo> findPunishBasisContents(int caseInfoId);
    
    List<CaseInfo> findIllegalClauseContents(int caseInfoId);
    
    CaseInfo findCaseInfoDetail(String caseInfoCompany);

	CaseInfo getCaseInfo(Map<String, Object> param);

}