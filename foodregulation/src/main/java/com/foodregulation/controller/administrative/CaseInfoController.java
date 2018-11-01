package com.foodregulation.controller.administrative;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.dao.entity.CaseInfo;
import com.foodregulation.service.administrative.CaseInfoService;
/**
 * 案件基本信息
 */
@Controller
@RequestMapping("/caseInfo")
public class CaseInfoController {
	
	@Autowired
	CaseInfoService caseInfoService;
	
	@RequestMapping("/caseInfo")
	public String caseInfo(){
		return "administrative/caseInfo";
	}
	
	@RequestMapping("/addCaseInfo")
	public String addCaseInfo(){
		return "administrative/addCaseInfo";
	}
	
	@RequestMapping("/editCaseInfo")
	public String editCaseInfo(){
		return "administrative/editCaseInfo";
	}
	/**
	 * 案件基本信息显示
	 */
	@RequestMapping("/selectCaseInfo")
	@ResponseBody
	public List<CaseInfo> selectCaseInfo(HttpServletRequest request){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startNum", request.getParameter("startNum"));
		params.put("limit", request.getParameter("limit"));
		params.put("caseInfoCompany", request.getParameter("caseInfoCompany"));
		params.put("caseInfoFrom", request.getParameter("caseInfoFrom"));
		params.put("caseInfoTime", request.getParameter("caseInfoTime"));
		List<CaseInfo> result = caseInfoService.selectCaseInfo(params);
		return result;
	}
	
	/**
	 * 案件基本信息显示(总条数)
	 */
	@RequestMapping("/selectCaseInfoTotal")
	@ResponseBody
	public int selectCaseInfoTotal(HttpServletRequest request){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("caseInfoCompany", request.getParameter("caseInfoCompany"));
		params.put("caseInfoFrom", request.getParameter("caseInfoFrom"));
		params.put("caseInfoTime", request.getParameter("caseInfoTime"));
		return caseInfoService.selectCaseInfoTotal(params);
	}
	
	
	/**
	 * 案件基本信息添加
	 */
	@RequestMapping("/insertCaseInfo")
	@ResponseBody
	public int insertCaseInfo(HttpServletRequest request,CaseInfo caseInfo){
		caseInfo.setCaseFromId(Integer.parseInt(request.getParameter("caseInfo_caseFromId")));
		int num = caseInfoService.insertCaseInfo(caseInfo);
		if(num>0){
			return num;
		}else{
			return num;
		}
	}
	
	/**
	 * 案件基本信息修改
	 */
	@RequestMapping("/updateCaseInfo")
	@ResponseBody
	public int updateCaseInfo(HttpServletRequest request,CaseInfo caseInfo){
		caseInfo.setCaseFromId(Integer.parseInt(request.getParameter("caseInfo_caseFromId")));
		int num  = caseInfoService.updateCaseInfo(caseInfo);
		if(num>0){
			return num;
		}else{
			return num;
		}
	}
	
	/**
	 * 案件基本信息修改--findone
	 */
	@RequestMapping("/findCaseInfo")
	@ResponseBody
	public CaseInfo findCaseInfo(HttpServletRequest request,int caseInfoId){
		CaseInfo caseInfo  = caseInfoService.findCaseInfo(caseInfoId);
		//request.setAttribute("caseInfo", caseInfo);
		return caseInfo;
	}
	
	/**
	 * 案件基本信息--查看详情
	 */
	@RequestMapping("/detailCaseInfo")
	public String detailCaseInfo(HttpServletRequest request,int caseInfoId){
		CaseInfo caseInfo  = caseInfoService.findCaseInfo(caseInfoId);
		request.setAttribute("caseInfo", caseInfo);
		return "administrative/detailCaseInfo";
	}
	
	/**
	 * 案件基本信息删除
	 */
	@RequestMapping("/deleteCaseInfo")
	@ResponseBody
	public int deleteCaseInfo(HttpServletRequest request,int caseInfoId){
		int num  = caseInfoService.deleteCaseInfo(caseInfoId);
		if(num>0){
			return num;
		}else{
			return num;
		}
	}
}
