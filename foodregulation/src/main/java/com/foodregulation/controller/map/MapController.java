package com.foodregulation.controller.map;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.dao.entity.AppUserLocation;
import com.foodregulation.service.map.MapService;

@Controller
@RequestMapping("map")
public class MapController {

	@Autowired
	MapService mapService;
	
	@RequestMapping("company")
	public String company(){
		return "map/company_map";
	}
	
	@RequestMapping("client")
	public String client(){
		return "map/client_map";
	}
	
	@RequestMapping("getNowLocation")
	@ResponseBody
	public List<AppUserLocation> getNowLocation(HttpServletRequest request){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("username", request.getParameter("username"));
		param.put("unit", request.getParameter("unit"));
		return mapService.getNowLocation(param);
	}
}
