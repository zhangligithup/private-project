package com.foodregulation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.service.enterprise.EnterpriseService;
import com.foodregulation.util.StringUtils;

@Controller
@RequestMapping("enterpriseInfo")
public class EnterpriseInfoController {

	@Autowired
	EnterpriseService enterpriseService;
	
	@RequestMapping("show")
	public String show(){
		return "enterpriseInfo/enterpriseInfo";
	}
	
	@RequestMapping("getEnterprise")
	@ResponseBody
	public List<Map<String,Object>> getEnterprise(HttpServletRequest request){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("enterpriseName", request.getParameter("enterpriseName")==null?"":request.getParameter("enterpriseName").trim());
		param.put("enterpriseNameLike", request.getParameter("enterpriseNameLike")==null?"":request.getParameter("enterpriseNameLike").trim());
		param.put("enterpriseType", request.getParameter("enterpriseType"));
		param.put("checkUnitCode", request.getParameter("checkUnitCode"));
		param.put("address", request.getParameter("address"));
		param.put("islola", request.getParameter("islola"));
		param.put("fazhengriqi", request.getParameter("fazhengriqi"));
		param.put("department", request.getParameter("department"));
		param.put("address", request.getParameter("address"));
		param.put("startNum", request.getParameter("startNum"));
		param.put("limit", request.getParameter("limit"));
		return enterpriseService.selectEnterpriseInfo(param);
	}
	
	@RequestMapping("getEnterpriseTotal")
	@ResponseBody
	public int getEnterpriseTotal(HttpServletRequest request){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("enterpriseName", request.getParameter("enterpriseName")==null?"":request.getParameter("enterpriseName").trim());
		param.put("enterpriseNameLike", request.getParameter("enterpriseNameLike")==null?"":request.getParameter("enterpriseNameLike").trim());
		param.put("enterpriseType", request.getParameter("enterpriseType"));
		param.put("checkUnitCode", request.getParameter("checkUnitCode"));
		param.put("address", request.getParameter("address"));
		param.put("islola", request.getParameter("islola"));
		param.put("fazhengriqi", request.getParameter("fazhengriqi"));
		param.put("department", request.getParameter("department"));
		param.put("address", request.getParameter("address"));
		return enterpriseService.selectEnterpriseInfoTotal(param);
	}

	@RequestMapping("getEnterpriseList")
	@ResponseBody
	public List<Map<String,Object>> getEnterpriseList(HttpServletRequest request){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("enterpriseType", request.getParameter("enterpriseType"));
		param.put("enterpriseName", request.getParameter("enterpriseName"));
		param.put("regionCode", request.getParameter("regionCode"));
		param.put("unitCode", request.getParameter("unitCode"));
		param.put("startNum", request.getParameter("startNum"));
		param.put("limit", request.getParameter("limit"));
		return enterpriseService.getEnterpriseList(param);
	}

	@RequestMapping("getEnterpriseListTotal")
	@ResponseBody
	public long getEnterpriseListTotal(HttpServletRequest request){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("enterpriseType", request.getParameter("enterpriseType"));
		param.put("enterpriseName", request.getParameter("enterpriseName"));
		param.put("regionCode", request.getParameter("regionCode"));
		param.put("unitCode", request.getParameter("unitCode"));
		return enterpriseService.getEnterpriseListTotal(param);
	}
	
	/**
	 * excel导出
	 */
	@RequestMapping("/excelEnterprise")
	public int excelEnterprise(HttpServletResponse response,HttpServletRequest request){
		response.setContentType("application/binary;charset=ISO8859_1");  
        try {  
            ServletOutputStream outputStream = response.getOutputStream(); 
            String fileName = new String(("企业信息").getBytes(), "ISO8859_1");  
            response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".xlsx");// 组装附件名称和格式  
            Map<String,Object> param = new HashMap<String,Object>();

            String[] titles = { "企业名称", "所属行政区域", "经营场所地址(具体到摊位号)","负责人","联系电话","注册号/统一社会信用代码","监管单位","食品经营许可证"};  
            enterpriseService.excelEnterprise(titles, outputStream,param);  
        }  
        catch (IOException e){  
            e.printStackTrace();  
        }  
        return 1;  
	}
	
	/**
	 * 获取企业类别下的企业名称搜索列表
	 * @param request
	 * @return
	 */
	@RequestMapping("getEnterpriseNameList")
	@ResponseBody
	public List<Map<String,Object>> getEnterpriseNameList(HttpServletRequest request){
		String type = request.getParameter("type");
		if(StringUtils.isBlank(type)){
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			list.addAll(enterpriseService.getEnterpriseNameList("agricultural"));
			list.addAll(enterpriseService.getEnterpriseNameList("cosmetic"));
			list.addAll(enterpriseService.getEnterpriseNameList("criculate"));
			list.addAll(enterpriseService.getEnterpriseNameList("drug"));
			list.addAll(enterpriseService.getEnterpriseNameList("food"));
			list.addAll(enterpriseService.getEnterpriseNameList("health"));
			list.addAll(enterpriseService.getEnterpriseNameList("industry"));
			list.addAll(enterpriseService.getEnterpriseNameList("medical"));
			list.addAll(enterpriseService.getEnterpriseNameList("production"));
			list.addAll(enterpriseService.getEnterpriseNameList("usemed"));
			list.addAll(enterpriseService.getEnterpriseNameList("wine"));
			return list;
		}
		String tableName="";
		switch(type){
			case "enterprise_1":tableName="agricultural";break;
			case "enterprise_8":tableName="cosmetic";break;
			case "enterprise_3":tableName="criculate";break;
			case "enterprise_9":tableName="drug";break;
			case "enterprise_4":tableName="food";break;
			case "enterprise_7":tableName="health";break;
			case "enterprise_5":tableName="industry";break;
			case "enterprise_10":tableName="medical";break;
			case "enterprise_2":tableName="production";break;
			case "enterprise_11":tableName="usemed";break;
			case "enterprise_6":tableName="wine";break;
			default:return new ArrayList<Map<String,Object>>();
		}
		return enterpriseService.getEnterpriseNameList(tableName);
	}
	
	@RequestMapping("likeEnterprise")
	@ResponseBody
	public List<Object> likeEnterprise(HttpServletRequest request){
		Map<String,Object> param = new HashMap<String,Object>();
		List<Map<String,Object>> enterpriseList = enterpriseService.selectEnterpriseInfo(param);
		List<Object> list = new ArrayList<Object>();
		Map<String, Object> map = null;
		for (int i = 0; i < enterpriseList.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("id", enterpriseList.get(i).get("id")+""+enterpriseList.get(i).get("qyname"));
			map.put("text", enterpriseList.get(i).get("qyname"));
			map.put("qyname", enterpriseList.get(i).get("qyname"));
			map.put("address", enterpriseList.get(i).get("scaddress"));
			map.put("addressName", enterpriseList.get(i).get("addressName"));
			map.put("qydelegate", enterpriseList.get(i).get("qydelegate"));
			map.put("qyphone", enterpriseList.get(i).get("qyphone"));
			map.put("scpermit", enterpriseList.get(i).get("scpermit"));
			map.put("zzcode", enterpriseList.get(i).get("zzcode"));
			list.add(map);
		}
		return list;
	}
}
