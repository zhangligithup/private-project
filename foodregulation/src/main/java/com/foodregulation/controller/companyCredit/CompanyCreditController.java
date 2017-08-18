package com.foodregulation.controller.companyCredit;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foodregulation.dao.entity.CaseInfo;
import com.foodregulation.dao.entity.Report;
import com.foodregulation.dao.entity.SupervisionAndCheck;
import com.foodregulation.service.companyCredit.CompanyCreditService;

@Controller
@RequestMapping("companyCredit")
public class CompanyCreditController {

	@Autowired
	CompanyCreditService companyCreditService;
	
	@RequestMapping("companyCredit")
	public String companyCredit(){
		return "companyCredit/companyCredit";
	}
	
	@RequestMapping("detailCredit")
	public String detailCredit(HttpServletRequest request){
		String qyname = request.getParameter("qyname");
		//基本信息
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("qyname",qyname);
		Map<String,Object> detailCreditList = companyCreditService.finEnterpriseInfo(param);
		request.setAttribute("detailCredit", detailCreditList);
		//行政处罚
		CaseInfo caseInfo = companyCreditService.findCaseInfoDetail(qyname);
		request.setAttribute("caseInfo", caseInfo);
		//投诉举报
		Report report = companyCreditService.findReportDetail(qyname);
		request.setAttribute("report", report);
		//监督检查
		SupervisionAndCheck supervisionAndCheck = companyCreditService.findSupervisionAndCheckDetail(qyname);
		request.setAttribute("supervisionAndCheck", supervisionAndCheck);
		
		return "companyCredit/detailCredit";
	}
	
	
}
