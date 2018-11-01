package com.foodregulation.controller.samplingInspection;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.dao.entity.Dictionary;
import com.foodregulation.dao.entity.FoodQuickCheck;
import com.foodregulation.dao.entity.User;
import com.foodregulation.service.Dictionary.DictionaryService;
import com.foodregulation.service.app.AppService;
import com.foodregulation.service.enterprise.EnterpriseService;
import com.foodregulation.service.person.PersonInfoService;
import com.foodregulation.service.samplingInspection.FoodQuickCheckService;
import com.foodregulation.util.StringUtils;

import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.admin.service.AdminService;
import cn.tslanpu.test.unit.Service.AddressService;
import cn.tslanpu.test.unit.Service.UnitService;

@Controller
@RequestMapping("foodQuickCheck")
public class FoodQuickCheckController {

	AdminService adminService = new AdminService();
	AddressService addressService = new AddressService();
	UnitService unitService = new UnitService();
	@Autowired
	PersonInfoService personInfoService;
	@Autowired
	DictionaryService dictionaryService;
	@Autowired
	AppService appService;
	@Autowired
	FoodQuickCheckService foodQuickCheckService;
	@Autowired
	EnterpriseService enterpriseService;

	@RequestMapping("/foodQuickCheckTask")
	public String foodQuickCheckIndex(HttpServletRequest request) {

		Map<String, Object> param = new HashMap<String, Object>();
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		param.put("username", username);
		param.put("password", password);
		param.put("type", 1);
		// pc端执法人员登录
		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");
		String unitCode = admin == null ? "" : admin.getUnitCode();
		request.getSession().setAttribute("unitCode", unitCode);
		// 1.查询所有单位,监管单位 2.保存到session域
		List<Dictionary> unitList = unitService.query();
		request.getSession().setAttribute("unitList", unitList);
		// 保存快检项目到session
		List<Dictionary> quickcheckprojectList = unitService.queryQuickcheckproject();
		request.getSession().setAttribute("quickcheckprojectList", quickcheckprojectList);
		if (admin == null) {
			// 企业端 人员登录
			User user = appService.userLogin(param);
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("account", username);
			request.getSession().setAttribute("enterpriseName", user.getEnterpriseName());
			request.getSession().setAttribute("unitName", "");
			return "samplingInspection/foodQuickCheckTaskApp";
		} else {
			request.getSession().setAttribute("account", admin.getUsername());
			for (Dictionary temp : unitList) {
				if (temp.gettDictionaryCode().equals(unitCode)) {
					request.getSession().setAttribute("unitName", temp.gettDictionaryName());
				}
			}
			request.getSession().setAttribute("enterpriseName", "");
			return "samplingInspection/foodQuickCheckTask";
		}
	}

	/**
	 * 小摊点移动端展示
	 * @param request
	 * @return
	 */
	@RequestMapping("selectfindQuickCheck")
	@ResponseBody
	public Map<String, Object> selectfindQuickCheck(HttpServletRequest request) {
		String qyname = request.getParameter("qyname");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("detectionedEnterprise", qyname);
		int total = foodQuickCheckService.findQuickCheckListTotal(map);
		Integer startNum = Integer.valueOf(request.getParameter("start"));
		Integer limit = Integer.valueOf(request.getParameter("count"));
		map.put("startNum", startNum);
		map.put("limit", limit);
		List<Dictionary> quickcheckprojectList = dictionaryService.getDictionaryByType(8);
		List<FoodQuickCheck> list = foodQuickCheckService.findQuickCheckList(map);
		for (FoodQuickCheck temp : list) {
			for (Dictionary quickcheckprojectTemp : quickcheckprojectList) {
				if (quickcheckprojectTemp.gettDictionaryCode().equals(temp.getProjectType())) {
					temp.setProjectName(quickcheckprojectTemp.gettDictionaryName());
				}
			}
		}
		map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("list", list);
		return map;
	}
	@RequestMapping("findQuickCheckTotal")
	@ResponseBody
	public int findQuickCheckTotal(HttpServletRequest request) {
		String sampleName = request.getParameter("sampleName") == null ? "" : request.getParameter("sampleName").trim();
		String quickcheckproject = request.getParameter("quickcheckproject") == null ? ""
				: request.getParameter("quickcheckproject").trim();
		String start_calenderOne = request.getParameter("start_calenderOne") == null ? ""
				: request.getParameter("start_calenderOne").trim();
		String end_calenderOne = request.getParameter("end_calenderOne") == null ? ""
				: request.getParameter("end_calenderOne").trim();
		String detectionedEnterprise = request.getParameter("detectionedEnterprise") == null ? ""
				: request.getParameter("detectionedEnterprise").trim();
		String detectionUnitCode = request.getParameter("detectionUnitCode") == null ? ""
				: request.getParameter("detectionUnitCode").trim();
		String result = request.getParameter("result") == null ? ""
				: request.getParameter("result").trim();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sampleName", sampleName);
		map.put("quickcheckproject", quickcheckproject);
		map.put("start_calenderOne", start_calenderOne);
		map.put("end_calenderOne", end_calenderOne);
		map.put("detectionedEnterprise", detectionedEnterprise);
		map.put("detectionUnitCode", detectionUnitCode);
		map.put("result", result);

		String account = request.getSession().getAttribute("account").toString();
		if(!"admin".equals(account)){
			String unitCode = request.getSession().getAttribute("unitCode") == null ? null
					: request.getSession().getAttribute("unitCode").toString();
			String enterpriseName = request.getSession().getAttribute("enterpriseName") == null ? null
					: request.getSession().getAttribute("enterpriseName").toString();
			map.put("unitCode", unitCode);
			map.put("enterpriseName", enterpriseName);
			map.put("account", account);
		}
		return foodQuickCheckService.findQuickCheckListTotal(map);
	}

	@RequestMapping("findQuickCheck")
	@ResponseBody
	public List<FoodQuickCheck> findQuickCheck(HttpServletRequest request) {
		String sampleName = request.getParameter("sampleName") == null ? "" : request.getParameter("sampleName").trim();
		String quickcheckproject = request.getParameter("quickcheckproject") == null ? ""
				: request.getParameter("quickcheckproject").trim();
		String start_calenderOne = request.getParameter("start_calenderOne") == null ? ""
				: request.getParameter("start_calenderOne").trim();
		String end_calenderOne = request.getParameter("end_calenderOne") == null ? ""
				: request.getParameter("end_calenderOne").trim();
		String detectionedEnterprise = request.getParameter("detectionedEnterprise") == null ? ""
				: request.getParameter("detectionedEnterprise").trim();
		String detectionUnitCode = request.getParameter("detectionUnitCode") == null ? ""
				: request.getParameter("detectionUnitCode").trim();
		String result = request.getParameter("result") == null ? ""
				: request.getParameter("result").trim();
		
		Integer startNum = Integer.valueOf(request.getParameter("startNum"));
		Integer limit = Integer.valueOf(request.getParameter("limit"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sampleName", sampleName);
		map.put("quickcheckproject", quickcheckproject);
		map.put("start_calenderOne", start_calenderOne);
		map.put("end_calenderOne", end_calenderOne);
		map.put("detectionedEnterprise", detectionedEnterprise);
		map.put("detectionUnitCode", detectionUnitCode);
		map.put("result", result);
		map.put("startNum", startNum);
		map.put("limit", limit);
		String account = request.getSession().getAttribute("account").toString();
		if(!"admin".equals(account)){
			String unitCode = request.getSession().getAttribute("unitCode") == null ? null
					: request.getSession().getAttribute("unitCode").toString();
			String enterpriseName = request.getSession().getAttribute("enterpriseName") == null ? null
					: request.getSession().getAttribute("enterpriseName").toString();
			map.put("unitCode", unitCode);
			map.put("enterpriseName", enterpriseName);
			map.put("account", account);
		}
		List<Dictionary> unitList = (List<Dictionary>) request.getSession().getAttribute("unitList");
		List<Dictionary> quickcheckprojectList = (List<Dictionary>) request.getSession()
				.getAttribute("quickcheckprojectList");
		List<FoodQuickCheck> list = foodQuickCheckService.findQuickCheckList(map);
		for (FoodQuickCheck temp : list) {
			temp.setDetectionUnitName("");
			for (Dictionary unitTemp : unitList) {
				if (unitTemp.gettDictionaryCode()
						.equals(temp.getDetectionUnitCode() == null ? "" : temp.getDetectionUnitCode())) {
					temp.setDetectionUnitName(unitTemp.gettDictionaryName());
				}
			}
			for (Dictionary quickcheckprojectTemp : quickcheckprojectList) {
				if (quickcheckprojectTemp.gettDictionaryCode().equals(temp.getProjectType())) {
					temp.setProjectName(quickcheckprojectTemp.gettDictionaryName());
				}
			}
		}
		return list;
	}

	@RequestMapping("batchAdd")
	@ResponseBody
	public int batchAdd(HttpServletRequest request, String params, String detectionDate, String detectionEnterpriseName,
			String detectionUnitCode) {
		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");
		// 0单位 1企业
		String detectionBodyType = "";
		if (admin == null) {
			detectionBodyType = "1";
		} else {
			detectionBodyType = "0";
		}
		List<FoodQuickCheck> foodQuickCheckList = new ArrayList<FoodQuickCheck>();
		String[] strArray = params.split(":");
		for (int i = 0; i < strArray.length; i++) {
			String temp = strArray[i];
			String[] tempArray = temp.split(",");
			FoodQuickCheck foodQuickCheck = new FoodQuickCheck();
			foodQuickCheck.setDetectionBodyType(detectionBodyType);
			foodQuickCheck.setDetectionDate(detectionDate);
			foodQuickCheck.setSampleName(tempArray[0]);
			foodQuickCheck.setProjectType(tempArray[1]);
			foodQuickCheck.setResult(tempArray[2]);
			foodQuickCheck.setDetectionedEnterprise(tempArray[3]);
			if(StringUtils.isNotBlank(tempArray[4])){
				foodQuickCheck.setImgUrl(tempArray[4]);
			}
			if(StringUtils.isNotBlank(tempArray[5])){
				foodQuickCheck.setNoQualifiedVideo(tempArray[5]);
			}
			foodQuickCheck.setDetectionUnitCode(detectionUnitCode);
			foodQuickCheck.setDetectionEnterpriseName(detectionEnterpriseName);
			foodQuickCheck.setAccount(request.getSession().getAttribute("account").toString());
			foodQuickCheckList.add(foodQuickCheck);
		}
		return foodQuickCheckService.batchInsert(foodQuickCheckList);
	}

	/**
	 * 判断企业是否存在
	 * 
	 * @param detectionEnterpriseName
	 * @return
	 */
	@RequestMapping("checkEnterpriseIsHave")
	@ResponseBody
	public int checkEnterpriseIsHave(String detectionEnterpriseName) {
		return enterpriseService.selectEnterpriseCountByName(detectionEnterpriseName);
	}
	
	@RequestMapping("deleteFoodQuickCheck")
	@ResponseBody
	public int removeFoodQuickCheck(Integer id){
		return foodQuickCheckService.removeFoodQuickCheck(id);
	}
	
	@RequestMapping("queryFoodQuickCheck")
	@ResponseBody
	public FoodQuickCheck queryFoodQuickCheck(Integer id){
		return foodQuickCheckService.queryFoodQuickCheck(id);
	}
	
	@RequestMapping("saveModifyFoodQuickCheck")
	@ResponseBody
	public int saveModifyFoodQuickCheck(FoodQuickCheck foodQuickCheck){
		return foodQuickCheckService.saveModifyFoodQuickCheck(foodQuickCheck);
	}
}
