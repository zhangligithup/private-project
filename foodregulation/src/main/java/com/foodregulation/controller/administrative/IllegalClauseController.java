package com.foodregulation.controller.administrative;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.dao.entity.IllegalClause;
import com.foodregulation.service.administrative.IllegalClauseService;
/**
 * 违法条款类型
 */
@Controller
@RequestMapping("/illegalClause")
public class IllegalClauseController {
	
	@Autowired
	IllegalClauseService illegalClauseService;
	
	@RequestMapping("/illegalClause")
	public String illegalClause(){
		return "administrative/illegalClause";
	}
	/**
	 * 违法条款显示
	 */
	@RequestMapping("/selectIllegalClause")
	@ResponseBody
	public List<IllegalClause> selectCasefrom(HttpServletRequest request){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startNum", request.getParameter("startNum"));
		params.put("limit", request.getParameter("limit"));
		params.put("illegalClauseCode", request.getParameter("illegalClauseCode"));
		List<IllegalClause> result = illegalClauseService.selectIllegalClause(params);
		return result;
	}
	
	/**
	 * 违法条款显示
	 */
	@RequestMapping("/selectIllegalClauseTotal")
	@ResponseBody
	public int selectIllegalClauseTotal(HttpServletRequest request){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("illegalClauseCode", request.getParameter("illegalClauseCode"));
		return illegalClauseService.selectIllegalClauseTotal(params);
	}
	
	/**
	 * 违法条款添加
	 */
	@RequestMapping("/insertIllegalClause")
	@ResponseBody
	public int insertIllegalClause(HttpServletRequest request,IllegalClause illegalClause){
		int num = illegalClauseService.insertIllegalClause(illegalClause);
		if(num>0){
			return num;
		}else{
			return num;
		}
	}
	
	/**
	 * 违法条款修改
	 */
	@RequestMapping("/updateIllegalClause")
	@ResponseBody
	public int updateIllegalClause(HttpServletRequest request,IllegalClause illegalClause){
		int num  = illegalClauseService.updateIllegalClause(illegalClause);
		if(num>0){
			return num;
		}else{
			return num;
		}
	}
	
	/**
	 * 违法条款修改--findone
	 */
	@RequestMapping("/findIllegalClause")
	@ResponseBody
	public IllegalClause findIllegalClause(HttpServletRequest request,int illegalClauseId){
		IllegalClause illegalClause  = illegalClauseService.findIllegalClause(illegalClauseId);
		return illegalClause;
	}
	
	/**
	 * 违法条款删除
	 */
	@RequestMapping("/deleteIllegalClause")
	@ResponseBody
	public int deleteIllegalClause(HttpServletRequest request,int illegalClauseId){
		int num  = illegalClauseService.deleteIllegalClause(illegalClauseId);
		if(num>0){
			return num;
		}else{
			return num;
		}
	}
}
