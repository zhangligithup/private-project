package com.foodregulation.controller.common;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.service.CommonService;
@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	CommonService commonService;
	
	
	/**
	 * 查询表中数据的数量
	 * @param params
	 * @return
	 */
	@RequestMapping("/selectDataCount")
	@ResponseBody
	public int selectDataCount(HttpServletRequest request){
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("tableName", request.getParameter("tableName"));
		return commonService.selectDataCount(params);
	}
	
	
}
