package com.foodregulation.controller.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.dao.entity.Report;
import com.foodregulation.service.report.ReportService;

import cn.tslanpu.test.admin.domain.Admin;
/**
 * 投诉举报
 */
@Controller
@RequestMapping("/report")
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	@RequestMapping("/report")
	public String report(){
		return "report/report";
	}
	
	/**
	 * 投诉举报显示
	 */
	@RequestMapping("/selectReport")
	@ResponseBody
	public List<Report> selectReport(HttpServletRequest request){
		Map<String, Object> params = new HashMap<String, Object>();
		String username = ((Admin) request.getSession().getAttribute("sessionAdmin")).getUsername();
		params.put("startNum", request.getParameter("startNum"));
		params.put("limit", request.getParameter("limit"));
		params.put("reportCompany", request.getParameter("reportCompany"));
		params.put("reportTime", request.getParameter("reportTime"));
		if(!"admin".equals(username)){
			params.put("username", username);
		}
		List<Report> result = reportService.selectReport(params);
		return result;
	}
	
	/**
	 * 投诉举报显示（总条数）
	 */
	@RequestMapping("/selectReportTotal")
	@ResponseBody
	public int selectReportTotal(HttpServletRequest request){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("reportCompany", request.getParameter("reportCompany"));
		params.put("reportTime", request.getParameter("reportTime"));
		return reportService.selectReportTotal(params);
	}
	
	/**
	 * 投诉举报添加
	 */
	@RequestMapping("/insertReport")
	@ResponseBody
	public int insertReport(HttpServletRequest request,Report report){
		int num = reportService.insertReport(report);
		return num;
	}
	
	/**
	 * 投诉举报修改
	 */
	@RequestMapping("/updateReport")
	@ResponseBody
	public int updateReport(HttpServletRequest request,Report report){
		int num  = reportService.updateReport(report);
		return num;
	}
	
	/**
	 * 投诉举报修改--findone
	 */
	@RequestMapping("/findReport")
	@ResponseBody
	public Report findReport(HttpServletRequest request,int reportId){
		Report report  = reportService.findReport(reportId);
		return report;
	}
	
	/**
	 * 投诉举报删除
	 */
	@RequestMapping("/deleteReport")
	@ResponseBody
	public int deleteReport(HttpServletRequest request,int reportId){
		int num  = reportService.deleteReport(reportId);
		return num;
	}
}
