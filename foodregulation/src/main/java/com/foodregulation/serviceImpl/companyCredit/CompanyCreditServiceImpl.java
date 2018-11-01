package com.foodregulation.serviceImpl.companyCredit;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.CaseInfo;
import com.foodregulation.dao.entity.Report;
import com.foodregulation.dao.entity.SupervisionAndCheck;
import com.foodregulation.dao.mapper.CaseInfoMapper;
import com.foodregulation.dao.mapper.EnterpriseInfoMapper;
import com.foodregulation.dao.mapper.ReportMapper;
import com.foodregulation.dao.mapper.SupervisionAndCheckMapper;
import com.foodregulation.service.companyCredit.CompanyCreditService;

@Service
public class CompanyCreditServiceImpl implements CompanyCreditService {

	@Autowired
	EnterpriseInfoMapper enterpriseInfoMapper;
	@Autowired
	CaseInfoMapper caseInfoMapper;
	@Autowired
	ReportMapper reportMapper;
	@Autowired
	SupervisionAndCheckMapper supervisionAndCheckMapper;

	@Override
	public Map<String, Object> finEnterpriseInfo(Map<String, Object> param) {
		return enterpriseInfoMapper.finEnterpriseInfo(param);
	}

	@Override
	public CaseInfo findCaseInfoDetail(String caseInfoCompany) {
		CaseInfo caseInfo = caseInfoMapper.findCaseInfoDetail(caseInfoCompany);
		if(caseInfo!=null){			
			//处罚依据
			List<CaseInfo> punishBasisContentsList = caseInfoMapper.findPunishBasisContents(caseInfo.getCaseInfoId());
			String punishBasisContents = "";
			if(punishBasisContentsList!=null&&punishBasisContentsList.size()!=0){
				CaseInfo caseInfo1 = punishBasisContentsList.get(0);
				if(caseInfo!=null&&caseInfo1!=null){
					punishBasisContents = caseInfo1.getPunishBasisContents()==null?"":caseInfo1.getPunishBasisContents();
				}
			}
			caseInfo.setPunishBasisContents(punishBasisContents);
			//违法条款
			List<CaseInfo> illegalClauseContentsList = caseInfoMapper.findIllegalClauseContents(caseInfo.getCaseInfoId());
			String illegalClauseContents = "";
			if(illegalClauseContentsList!=null&&illegalClauseContentsList.size()!=0){
				CaseInfo caseInfo2 = illegalClauseContentsList.get(0);
				if(caseInfo!=null&&caseInfo2!=null){
					illegalClauseContents = caseInfo2.getIllegalClauseContents()==null?"":caseInfo2.getIllegalClauseContents();
				}
			}
			caseInfo.setIllegalClauseContents(illegalClauseContents);
		}
		
		return caseInfo;
	}

	@Override
	public Report findReportDetail(String reportCompany) {
		return reportMapper.findReportDetail(reportCompany);
	}

	@Override
	public SupervisionAndCheck findSupervisionAndCheckDetail(String checkedEnterpriseName) {
		return supervisionAndCheckMapper.findSupervisionAndCheckDetail(checkedEnterpriseName);
	}
	
	

}
