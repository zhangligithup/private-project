package com.foodregulation.controller.administrative;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.dao.entity.PunishBasis;
import com.foodregulation.service.administrative.PunishBasisService;
/**
 * 处罚依据
 */
@Controller
@RequestMapping("/punishBasis")
public class PunishBasisController {
	
	@Autowired
	PunishBasisService punishBasisService;
	
	@RequestMapping("/punishBasis")
	public String punishBasis(){
		return "administrative/punishBasis";
	}
	/**
	 * 处罚依据显示
	 */
	@RequestMapping("/selectPunishBasis")
	@ResponseBody
	public List<PunishBasis> selectPunishBasis(HttpServletRequest request){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("punishBasisCode", request.getParameter("punishBasisCode"));
		params.put("startNum", request.getParameter("startNum"));
		params.put("limit", request.getParameter("limit"));
		List<PunishBasis> result = punishBasisService.selectPunishBasis(params);
		return result;
	}
	
	/**
	 * 处罚依据显示
	 */
	@RequestMapping("/selectPunishBasisTotal")
	@ResponseBody
	public int selectPunishBasisTotal(HttpServletRequest request){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("punishBasisCode", request.getParameter("punishBasisCode"));
		return punishBasisService.selectPunishBasisTotal(params);
	}
	
	/**
	 * 处罚依据添加
	 */
	@RequestMapping("/insertPunishBasis")
	@ResponseBody
	public int insertPunishBasis(HttpServletRequest request,PunishBasis punishBasis){
		int num = punishBasisService.insertPunishBasis(punishBasis);
		if(num>0){
			return num;
		}else{
			return num;
		}
	}
	
	/**
	 * 处罚依据修改
	 */
	@RequestMapping("/updatePunishBasis")
	@ResponseBody
	public int updatePunishBasis(HttpServletRequest request,PunishBasis punishBasis){
		int num  = punishBasisService.updatePunishBasis(punishBasis);
		if(num>0){
			return num;
		}else{
			return num;
		}
	}
	
	/**
	 * 处罚依据修改--findone
	 */
	@RequestMapping("/findPunishBasis")
	@ResponseBody
	public PunishBasis findCasefrom(HttpServletRequest request,int punishBasisId){
		PunishBasis punishBasis  = punishBasisService.findPunishBasis(punishBasisId);
		return punishBasis;
	}
	
	/**
	 * 处罚依据删除
	 */
	@RequestMapping("/deletePunishBasis")
	@ResponseBody
	public int deletePunishBasis(HttpServletRequest request,int punishBasisId){
		int num  = punishBasisService.deletePunishBasis(punishBasisId);
		if(num>0){
			return num;
		}else{
			return num;
		}
	}
}
