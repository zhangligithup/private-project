package com.foodregulation.service.companyCredit;

import java.util.Map;

import com.foodregulation.dao.entity.CaseInfo;
import com.foodregulation.dao.entity.Report;
import com.foodregulation.dao.entity.SupervisionAndCheck;

public interface CompanyCreditService {
	
	Map<String, Object> finEnterpriseInfo(Map<String, Object> param);
	
	CaseInfo findCaseInfoDetail(String caseInfoCompany);
	
	 Report findReportDetail(String reportCompany);
	 
	 SupervisionAndCheck findSupervisionAndCheckDetail(String checkedEnterpriseName);

}
