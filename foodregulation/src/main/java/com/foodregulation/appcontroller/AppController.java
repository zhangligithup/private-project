package com.foodregulation.appcontroller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.foodregulation.dao.entity.AdditiveFiling;
import com.foodregulation.dao.entity.Agricultural;
import com.foodregulation.dao.entity.AppUserLocation;
import com.foodregulation.dao.entity.CaseInfo;
import com.foodregulation.dao.entity.Cosmetic;
import com.foodregulation.dao.entity.Criculate;
import com.foodregulation.dao.entity.Dictionary;
import com.foodregulation.dao.entity.Drug;
import com.foodregulation.dao.entity.EnterpriseInfo;
import com.foodregulation.dao.entity.EnterpriseUser;
import com.foodregulation.dao.entity.ExamRecord;
import com.foodregulation.dao.entity.Examination;
import com.foodregulation.dao.entity.Food;
import com.foodregulation.dao.entity.Health;
import com.foodregulation.dao.entity.Industry;
import com.foodregulation.dao.entity.KeepRecord;
import com.foodregulation.dao.entity.Medical;
import com.foodregulation.dao.entity.Notification;
import com.foodregulation.dao.entity.PersonInfo;
import com.foodregulation.dao.entity.Physical;
import com.foodregulation.dao.entity.Production;
import com.foodregulation.dao.entity.PurchaseLedger;
import com.foodregulation.dao.entity.Report;
import com.foodregulation.dao.entity.SamplingInspection;
import com.foodregulation.dao.entity.SolveReport;
import com.foodregulation.dao.entity.SupervisionAndCheck;
import com.foodregulation.dao.entity.Usemed;
import com.foodregulation.dao.entity.User;
import com.foodregulation.dao.entity.Wine;
import com.foodregulation.service.Dictionary.DictionaryService;
import com.foodregulation.service.app.AppService;
import com.foodregulation.service.enterprise.EnterpriseService;
import com.foodregulation.service.exam.ExamRelationService;
import com.foodregulation.service.exam.ExaminationService;
import com.foodregulation.service.notification.NotificationService;
import com.foodregulation.service.origin.OriginService;
import com.foodregulation.service.person.PersonInfoService;
import com.foodregulation.service.physical.PhysicalService;
import com.foodregulation.service.report.ReportService;
import com.foodregulation.service.report.SolveReportService;
import com.foodregulation.util.Constant;
import com.foodregulation.util.DateUtil;
import com.foodregulation.util.ResultUtil;
import com.foodregulation.util.StringUtils;

import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.admin.service.AdminService;
import cn.tslanpu.test.unit.Service.UnitService;

@Controller
@RequestMapping("app")
public class AppController {

	@Autowired
	EnterpriseService enterpriseService;
	@Autowired
	AppService appService;
	@Autowired
	SolveReportService solveReportService;
	@Autowired
	PhysicalService physicalService;
	@Autowired
	PersonInfoService personInfoService;
	@Autowired
	ExaminationService examinationService;
	@Autowired
	ExamRelationService examRelationService;
	@Autowired
	OriginService originService;
	@Autowired
	NotificationService notificationService;
	@Autowired
	DictionaryService dictionaryService;
	@Autowired
	ReportService reportService;
	AdminService adminService = new AdminService();

	@RequestMapping("enterprise")
	@ResponseBody
	public JSONObject getEnterprise(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("enterpriseName", request.getParameter("enterpriseName"));
		param.put("enterpriseType", request.getParameter("enterpriseType"));
		param.put("fazhengriqi", request.getParameter("fazhengriqi"));
		param.put("startNum", request.getParameter("startNum"));
		param.put("searchkey", request.getParameter("searchkey"));
		param.put("enterpriseNameLike", request.getParameter("enterpriseNameLike"));//企业名称模糊查询
		param.put("enterpriseType", request.getParameter("enterpriseType"));//企业类别查询
		param.put("checkUnitCode", request.getParameter("checkUnitCode"));//监管单位
		param.put("address", request.getParameter("address"));//企行政区域
		param.put("startNum", (Integer.parseInt(request.getParameter("pageindex")==null?"1":request.getParameter("pageindex")) - 1) * 10);
		param.put("limit",
				StringUtils.isBlank(request.getParameter("pagesize")) ? 10 : request.getParameter("pagesize"));
		try {

			List<Map<String, Object>> data = enterpriseService.selectEnterpriseInfo(param);
			JSONArray array = new JSONArray();
			for (int i = 0; i < data.size(); i++) {
				Map<String, Object> map = data.get(i);
				EnterpriseInfo info = new EnterpriseInfo();
				info.setId(Integer.parseInt(map.get("id").toString()));
				info.setAddress(map.get("address") == null ? "" : map.get("address").toString());
				info.setAddressName(map.get("addressName") == null ? "" : map.get("addressName").toString());
				info.setDepartment(map.get("department") == null ? "" : map.get("department").toString());
				info.setDepartmentName(map.get("departmentName") == null ? "" : map.get("departmentName").toString());
				info.setQyname(map.get("qyname") == null ? "" : map.get("qyname").toString());
				info.setScpermit(map.get("scpermit") == null ? "" : map.get("scpermit").toString());
				info.setYouxiaodate(map.get("youxiaodate") == null ? "" : map.get("youxiaodate").toString());
				info.setScaddress(map.get("scaddress") == null ? "" : map.get("scaddress").toString());
				info.setEnterpriseType(map.get("enterpriseType")==null?"":map.get("enterpriseType").toString());
				info.setEnterpriseTypeName("");
				if(map.get("enterpriseType")!=null){
					if (map.get("enterpriseType").toString().equals("enterprise_1")) {
						info.setEnterpriseTypeName("食用农产品经营户");
					} else if (map.get("enterpriseType").toString().equals("enterprise_2")) {
						info.setEnterpriseTypeName("食品生产企业");
					} else if (map.get("enterpriseType").toString().equals("enterprise_3")) {
						info.setEnterpriseTypeName("食品销售企业");
					} else if (map.get("enterpriseType").toString().equals("enterprise_4")) {
						info.setEnterpriseTypeName("食品餐饮企业");
					} else if (map.get("enterpriseType").toString().equals("enterprise_5")) {
						info.setEnterpriseTypeName("食品五小行业");
					} else if (map.get("enterpriseType").toString().equals("enterprise_6")) {
						info.setEnterpriseTypeName("酒类销售企业");
					} else if (map.get("enterpriseType").toString().equals("enterprise_7")) {
						info.setEnterpriseTypeName("保健食品销售企业");
					} else if (map.get("enterpriseType").toString().equals("enterprise_8")) {
						info.setEnterpriseTypeName("化妆品销售企业");
					} else if (map.get("enterpriseType").toString().equals("enterprise_9")) {
						info.setEnterpriseTypeName("药品零售企业");
					} else if (map.get("enterpriseType").toString().equals("enterprise_10")) {
						info.setEnterpriseTypeName("医疗器械销售企业");
					} else if (map.get("enterpriseType").toString().equals("enterprise_11")) {
						info.setEnterpriseTypeName("医疗器械使用企业");
					}
				}
			
				info.setQydelegate(map.get("qydelegate")==null?"":map.get("qydelegate").toString());
				info.setQyphone(map.get("qyphone")==null?"":map.get("qyphone").toString());
				info.setZzcode(map.get("zzcode")==null?"":map.get("zzcode").toString());
				array.add(info);
			}
			return ResultUtil.appJsonObject(true, "", "data", array);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultUtil.appJsonObject(false, "查询失败");
		}
	}

	@RequestMapping("login")
	@ResponseBody
	public JSONObject login(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameter("type");

		// 参数验证
		if (StringUtils.isBlank(username)) {
			return ResultUtil.appJsonObject(false, "用户名不能为空");
		}
		if (StringUtils.isBlank(password)) {
			return ResultUtil.appJsonObject(false, "密码不能为空");
		}
		if (StringUtils.isBlank(type)) {
			return ResultUtil.appJsonObject(false, "登录类型不能为空");
		}

		param.put("username", username);
		param.put("password", password);
		param.put("type", type);
		User user = appService.userLogin(param);

		if (user!=null) {
			return ResultUtil.appJsonObject(true, "", "data", user);
		}else{
			return ResultUtil.appJsonObject(false, "用户名或密码错误");
		}
	}

	/**
	 * 监督检查
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("jdjcDatil")
	@ResponseBody
	public JSONObject jdjcDatil(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		String enterpriseName = request.getParameter("enterpriseName");
		try {
			if (StringUtils.isBlank(enterpriseName)) {
				return ResultUtil.appJsonObject(true, "", "data", new SupervisionAndCheck());
			}
			param.put("enterpriseName", enterpriseName);
			List<SupervisionAndCheck> sacList = appService.getSupervisionAndCheck(param);
			if (sacList == null || sacList.size() == 0) {
				return ResultUtil.appJsonObject(true, "", "data", new SupervisionAndCheck());
			} else {
				return ResultUtil.appJsonObject(true, "", "data", sacList.get(0));
			}
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}

	/**
	 * 抽样检查检查报告
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("cyjcDatil")
	@ResponseBody
	public JSONObject cyjcDatil(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		String enterpriseName = request.getParameter("enterpriseName");
		try {

			if (StringUtils.isBlank(enterpriseName)) {
				enterpriseName = "";
			}
			param.put("enterpriseName", enterpriseName);
			SamplingInspection sac = appService.getSamplingInspection(param);
			if (sac == null) {
				return ResultUtil.appJsonObject(true, "", "data", "");
			} else {
				String from_data = sac.getSamplingForm();// 获取检查报告数据
				if (StringUtils.isNotBlank(from_data)) {
					JSONObject json = JSONObject.parseObject(from_data);
					return ResultUtil.appJsonObject(true, "", "data", json);
				} else {
					return ResultUtil.appJsonObject(true, "", "data", "");
				}
			}
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}

	/**
	 * 行政处罚
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("xzcfDatil")
	@ResponseBody
	public JSONObject xzcfDatil(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		String enterpriseName = request.getParameter("enterpriseName");
		try {

			if (StringUtils.isBlank(enterpriseName)) {
				enterpriseName = "";
			}
			param.put("enterpriseName", enterpriseName);
			CaseInfo sac = appService.getCaseInfo(param);
			if (sac == null) {
				sac = new CaseInfo();
			}
			return ResultUtil.appJsonObject(true, "", "data", sac);
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}

	/**
	 * 投诉详情
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("tsjyDatil")
	@ResponseBody
	public JSONObject tsjyDatil(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		String enterpriseName = request.getParameter("enterpriseName");
		String reportId = request.getParameter("reportId");

		try {
			param.put("enterpriseName", enterpriseName);
			param.put("reportId", reportId);
			if(StringUtils.isBlank(enterpriseName)&&StringUtils.isBlank(reportId)){
				return ResultUtil.appJsonObject(true, "", "data", new Report());
			}
			Report sac = appService.getReport(param);
			if (sac == null) {
				sac = new Report();
			}
			return ResultUtil.appJsonObject(true, "", "data", sac);
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}

	/**
	 * 投诉列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("tsjyList")
	@ResponseBody
	public JSONObject tsjyList(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		try {
			//获取人员id
			String username = request.getParameter("username");
			if(!"admin".equals(username)){
				param.put("personId", personInfoService.findPersonByName(username).getPersonId());
			}
			param.put("startNum", Integer.parseInt(request.getParameter("pageindex"))<1?0:Integer.parseInt(request.getParameter("pageindex"))-1);
			param.put("limit",
					StringUtils.isBlank(request.getParameter("pagesize")) ? 10 : request.getParameter("pagesize"));
			List<Report> sac = appService.getReportList(param);
			if (sac == null) {
				sac = new ArrayList<Report>();
			}
			return ResultUtil.appJsonObject(true, "", "data", sac);
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}

	/**
	 * 处理投诉
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("solveReport")
	@ResponseBody
	public JSONObject solveReport(HttpServletRequest request) {
		try {
			String idStr = request.getParameter("reportId");
			String createPepole = request.getParameter("createPepole");
			String isSatisfied = request.getParameter("isSatisfied");
			String isRecord = request.getParameter("isRecord");
			String solveSituation = request.getParameter("solveSituation");
			String imgUrl = request.getParameter("imgUrl");
			// StringBuffer imgUrlBuf = new StringBuffer();

			if (StringUtils.isBlank(idStr)) {
				return ResultUtil.appJsonObject(false, "后台需要获取投诉ID");
			}
			if (solveReportService.findHandleReport(idStr) != null) {
				return ResultUtil.appJsonObject(false, "投诉已处理，不能重复处理");
			}
			SolveReport sr = new SolveReport();
			sr.setReportId(Long.parseLong(idStr));
			sr.setCreatePepole(createPepole);
			sr.setIsRecord(isRecord);
			sr.setIsSatisfied(isSatisfied);
			sr.setSolveSituation(solveSituation);

			// if(StringUtils.isBlank(imgUrl)){
			// String rootPath =
			// request.getSession().getServletContext().getRealPath("/");
			//
			// // 上传新的图像
			// for(MultipartFile file:files){
			// String fileName = file.getOriginalFilename();
			// String[] strArr = fileName.split("\\.");
			// fileName = new Date().getTime() + "." + strArr[strArr.length -
			// 1];
			// File targetFile = new File(rootPath + "file/", fileName);
			// if (!targetFile.exists()) {
			// targetFile.mkdirs();
			// }
			// // 保存
			// try {
			// file.transferTo(targetFile);
			// imgUrlBuf.append(","+rootPath + "file/" + fileName);
			// } catch (Exception e) {
			// e.printStackTrace();
			// }
			// }
			// String url = imgUrl.toString();
			// if(!"".equals(url)){
			// url = url.substring(1);
			// }
			// sr.setImgUrl(url);
			// }else{
			// sr.setImgUrl(imgUrl);
			// }
			sr.setImgUrl(imgUrl);
			appService.insertSolveReport(sr);
			Report report = new Report();
			report.setReportId(Integer.valueOf(idStr));
			report.setReportStatus("1");
			reportService.updateReport(report);
			return ResultUtil.appJsonObject(true, "插入成功");
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}

	/**
	 * 添加企业信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("addQy")
	@ResponseBody
	public JSONObject addQy(HttpServletRequest request) {

		String enterpriseType = request.getParameter("enterpriseType");
		if (StringUtils.isBlank(enterpriseType)) {
			return ResultUtil.appJsonObject(false, "请选择企业类型");
		}

		String qyname = request.getParameter("enterpriseName");
		if (StringUtils.isBlank(qyname)) {
			return ResultUtil.appJsonObject(false, "请填写企业名称");
		}

		String address = request.getParameter("address");
		if (StringUtils.isBlank(address)) {
			return ResultUtil.appJsonObject(false, "请填写行政区域");
		}

		String scaddress = request.getParameter("scaddress");
		if (StringUtils.isBlank(scaddress)) {
			return ResultUtil.appJsonObject(false, "请填写企业地址");
		}

		String qydelegate = request.getParameter("qydelegate");
		if (StringUtils.isBlank(qydelegate)) {
			return ResultUtil.appJsonObject(false, "请填写企业联系人");
		}

		String qyphone = request.getParameter("qyphone");
		if (StringUtils.isBlank(qyphone)) {
			return ResultUtil.appJsonObject(false, "请填写手机号");
		}

		String zzcode = request.getParameter("zzcode");
		if (StringUtils.isBlank(zzcode)) {
			return ResultUtil.appJsonObject(false, "请填写注册号/统一社会信用代码");
		}

		String scpermit = request.getParameter("scpermit");
		if (StringUtils.isBlank(scpermit)) {
			return ResultUtil.appJsonObject(false, "请填写注许可证编号");
		}

		String youxiaodate = request.getParameter("youxiaodate");
		if (StringUtils.isBlank(youxiaodate)) {
			return ResultUtil.appJsonObject(false, "请填写有效期");
		}

		String department = request.getParameter("department");
		if (StringUtils.isBlank(department)) {
			return ResultUtil.appJsonObject(false, "请填写监督单位");
		}
		try {
			if (enterpriseType.equals("食用农产品经营户")) {// 食用农产品经营户
				Agricultural a = new Agricultural();
				a.setQyname(qyname);
				a.setAddress(address);
				a.setScaddress(scaddress);
				a.setQydelegate(qydelegate);
				a.setQyphone(qyphone);
				a.setZzcode(zzcode);
				a.setScpermit(scpermit);
				a.setYouxiaodate(youxiaodate);
				a.setDepartment(department);
				appService.insertAgricultural(a);
			} else if (enterpriseType.equals("食品生产企业")) {// 食品生产企业
				Production a = new Production();
				a.setQyname(qyname);
				a.setAddress(address);
				a.setScaddress(scaddress);
				a.setQydelegate(qydelegate);
				a.setQyphone(qyphone);
				a.setZzcode(zzcode);
				a.setScpermit(scpermit);
				a.setYouxiaodate(youxiaodate);
				a.setDepartment(department);
				appService.insertProduction(a);
			} else if (enterpriseType.equals("食品销售企业")) {// 食品销售企业
				Criculate a = new Criculate();
				a.setQyname(qyname);
				a.setAddress(address);
				a.setScaddress(scaddress);
				a.setQydelegate(qydelegate);
				a.setQyphone(qyphone);
				a.setZzcode(zzcode);
				a.setScpermit(scpermit);
				a.setYouxiaodate(youxiaodate);
				a.setDepartment(department);
				appService.insertCriculate(a);
			} else if (enterpriseType.equals("食品餐饮企业")) {// 食品餐饮企业
				Food a = new Food();
				a.setQyname(qyname);
				a.setAddress(address);
				a.setScaddress(scaddress);
				a.setQydelegate(qydelegate);
				a.setQyphone(qyphone);
				a.setZzcode(zzcode);
				a.setScpermit(scpermit);
				a.setYouxiaodate(youxiaodate);
				a.setDepartment(department);
				appService.insertFood(a);
			} else if (enterpriseType.equals("食品五小行业")) {// 食品五小行业
				Industry a = new Industry();
				a.setQyname(qyname);
				a.setAddress(address);
				a.setScaddress(scaddress);
				a.setQydelegate(qydelegate);
				a.setQyphone(qyphone);
				a.setZzcode(zzcode);
				a.setScpermit(scpermit);
				a.setYouxiaodate(youxiaodate);
				a.setDepartment(department);
				appService.insertIndustry(a);
			} else if (enterpriseType.equals("酒类销售企业")) {// 酒类销售企业
				Wine a = new Wine();
				a.setQyname(qyname);
				a.setAddress(address);
				a.setScaddress(scaddress);
				a.setQydelegate(qydelegate);
				a.setQyphone(qyphone);
				a.setZzcode(zzcode);
				a.setScpermit(scpermit);
				a.setYouxiaodate(youxiaodate);
				a.setDepartment(department);
				appService.insertWine(a);
			} else if (enterpriseType.equals("保健食品销售企业")) {// 保健食品销售企业
				Health a = new Health();
				a.setQyname(qyname);
				a.setAddress(address);
				a.setScaddress(scaddress);
				a.setQydelegate(qydelegate);
				a.setQyphone(qyphone);
				a.setZzcode(zzcode);
				a.setScpermit(scpermit);
				a.setYouxiaodate(youxiaodate);
				a.setDepartment(department);
				appService.insertHealth(a);
			} else if (enterpriseType.equals("化妆品销售企业")) {// 化妆品销售企业
				Cosmetic a = new Cosmetic();
				a.setQyname(qyname);
				a.setAddress(address);
				a.setScaddress(scaddress);
				a.setQydelegate(qydelegate);
				a.setQyphone(qyphone);
				a.setZzcode(zzcode);
				a.setScpermit(scpermit);
				a.setYouxiaodate(youxiaodate);
				a.setDepartment(department);
				appService.insertCosmetic(a);
			} else if (enterpriseType.equals("药品零售企业")) {// 药品零售企业
				Drug a = new Drug();
				a.setQyname(qyname);
				a.setAddress(address);
				a.setScaddress(scaddress);
				a.setQydelegate(qydelegate);
				a.setQyphone(qyphone);
				a.setZzcode(zzcode);
				a.setScpermit(scpermit);
				a.setYouxiaodate(youxiaodate);
				a.setDepartment(department);
				appService.insertDrug(a);
			} else if (enterpriseType.equals("医疗器械销售企业")) {// 药品零售企业
				Medical a = new Medical();
				a.setQyname(qyname);
				a.setAddress(address);
				a.setScaddress(scaddress);
				a.setQydelegate(qydelegate);
				a.setQyphone(qyphone);
				a.setZzcode(zzcode);
				a.setScpermit(scpermit);
				a.setYouxiaodate(youxiaodate);
				a.setDepartment(department);
				appService.insertMedical(a);
			} else if (enterpriseType.equals("医疗器械使用企业")) {// 医疗器械使用企业
				Usemed a = new Usemed();
				a.setQyname(qyname);
				a.setAddress(address);
				a.setScaddress(scaddress);
				a.setQydelegate(qydelegate);
				a.setQyphone(qyphone);
				a.setZzcode(zzcode);
				a.setScpermit(scpermit);
				a.setYouxiaodate(youxiaodate);
				a.setDepartment(department);
				appService.insertUsemed(a);
			}

			return ResultUtil.appJsonObject(true, "插入成功");
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}

	/**
	 * 调用监督检查列表页
	 * 
	 * @return
	 */
	@RequestMapping("jdjcList")
	public String jdjcList(HttpServletRequest request) {
		// 保存企业类别到session
		UnitService unitService = new UnitService();
		List<Dictionary> enterpriseTypeList = unitService.queryEnterpriseInfo();
		request.getSession().setAttribute("enterpriseTypeList", enterpriseTypeList);

		// 查询所有单位,监管单位
		List<Dictionary> unitList = unitService.query();
		request.getSession().setAttribute("unitList", unitList);
		//保存检查频次到session
        List<Dictionary> checkFrequencyList = dictionaryService.getDictionaryByType(6);
        request.getSession().setAttribute("checkFrequencyList", checkFrequencyList);
        Admin admin = adminService.query(request.getParameter("username"),"");
        if(Constant.ADMIN.equals(request.getParameter("username"))){
        	request.setAttribute("currentUnitCode","");
        	admin.setUnitCode("");
        }else{
        	request.setAttribute("currentUnitCode",admin.getUnitCode());
        }
        request.getSession().setAttribute("sessionAdmin", admin);
        return "supervisionAndCheck/supervisionAndCheckTaskApp";
	}

	@RequestMapping("insertAppUserLocation")
	@ResponseBody
	public JSONObject insertAppUserLocation(HttpServletRequest request) {
		String userName = request.getParameter("userName");
		if (userName == null) {
			return ResultUtil.appJsonObject(false, "用户名为空");
		}
		Float longitude = null;
		try {
			longitude = Float.valueOf(request.getParameter("longitude"));
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, "经度为空或不是float类型");
		}
		Float latitude = null;
		try {
			latitude = Float.valueOf(request.getParameter("latitude"));
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, "纬度为空或不是float类型");
		}
		String timestamp = request.getParameter("timestamp");
		if (timestamp == null) {
			return ResultUtil.appJsonObject(false, "请求时间为空");
		}
		AppUserLocation appUserLocation = new AppUserLocation();
		appUserLocation.setLatitude(latitude);
		appUserLocation.setLongitude(longitude);
		appUserLocation.setTimestamp(timestamp);
		appUserLocation.setUsername(userName);
		try {
			int num = appService.insertAppUserLocation(appUserLocation);
			if (num > 0) {
				return ResultUtil.appJsonObject(true, "位置信息保存成功");
			} else {
				return ResultUtil.appJsonObject(false, "位置信息保存失败");
			}
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, "服务器错误:" + e.getMessage());
		}
	}

	/**
	 * 体检记录列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/selectPhysical")
	@ResponseBody
	public JSONObject selectPhysical(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", request.getParameter("type"));// 1 :已过期 2:未过期
		param.put("companyName", request.getParameter("companyName"));//企业名称
		param.put("physicalName", request.getParameter("physicalName"));//体检人姓名
		initPage(request, param);
		List<Physical> data = physicalService.selectPhysical(param);

		return ResultUtil.appJsonObject(true, "", "data", data);
	}

	private void initPage(HttpServletRequest request, Map<String, Object> map) {

		int pagesize = StringUtils.isBlank(request.getParameter("pagesize")) ? 10
				: Integer.parseInt(request.getParameter("pagesize"));
		map.put("limit", pagesize);

		if (StringUtils.isBlank(request.getParameter("pageindex"))) {
			map.put("startNum", 0);
		} else {
			int pageindex = Integer.parseInt(request.getParameter("pageindex"));

			map.put("startNum", (pageindex - 1) * pagesize);
		}

	}

	/**
	 * 查找体检记录
	 * 
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("/findPhysical")
	@ResponseBody
	public JSONObject findPhysical(HttpServletRequest request, Long id) {

		Physical data = physicalService.findPhysical(id);

		return ResultUtil.appJsonObject(true, "", "data", data);
	}

	/**
	 * 新增体检记录
	 * 
	 * @param request
	 * @param physical
	 * @return
	 */
	@RequestMapping("/addPhysical")
	@ResponseBody
	public JSONObject addPhysical(HttpServletRequest request, Physical physical) {
		boolean pageResult = false;
		try {
			if (StringUtils.isBlank(physical.getCompanyName())) {
				return ResultUtil.appJsonObject(false, "企业名称不能为空");
			}
			if (StringUtils.isBlank(physical.getHospital())) {
				return ResultUtil.appJsonObject(false, "体检医院不能为空");
			}
			if (StringUtils.isBlank(physical.getPhysicalName())) {
				return ResultUtil.appJsonObject(false, "体检人姓名不能为空");
			}
			if (StringUtils.isBlank(physical.getPhone())) {
				return ResultUtil.appJsonObject(false, "联系电话不能为空");
			}
			if (StringUtils.isBlank(physical.getPhysicalDateStr())) {
				return ResultUtil.appJsonObject(false, "体检日期不能为空");
			}
			if (StringUtils.isBlank(physical.getReportDateStr())) {
				return ResultUtil.appJsonObject(false, "报告日期不能为空");
			}
			if (null == physical.getEnterpriseTypeId() ||"0".equals(physical.getEnterpriseTypeId())) {
				return ResultUtil.appJsonObject(false, "企业类别id不能为空");
			}

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			//
			// String physicalDateStr =
			// physical.getPhysicalDateStr().replace("年/", "-").replace("月/",
			// "-").replace("日", "");
			physical.setPhysicalDate(dateFormat.parse(physical.getPhysicalDateStr()));
			//
			// String reportDateStr = physical.getReportDateStr().replace("年/",
			// "-").replace("月/", "-").replace("日", "");
			physical.setReportDate(dateFormat.parse(physical.getReportDateStr()));

			EnterpriseUser enterpriseUser=physicalService.selectEnterpriseUserByUsername(physical.getPhone());
            if(enterpriseUser==null){
            	EnterpriseUser user=new EnterpriseUser();
                user.setUserName(physical.getPhone());
                user.setEnterpriseName(physical.getCompanyName());
                user.setPassword("123456");

                physicalService.addEnterpriseUser(user);
            }else {
                return ResultUtil.appJsonObject(false,"联系电话已存在");
            }

			int add = physicalService.addPhysical(physical);
			if (add > 0) {
				pageResult = true;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return ResultUtil.jsonObject(pageResult ? "true" : "false", "");
	}

	/**
	 * 查找我的试卷
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/findMyExamination")
	@ResponseBody
	public JSONObject findMyExamination(HttpServletRequest request) {
		String type = request.getParameter("type");//type   1执法端    0企业端
		String personId = request.getParameter("personId");// 人员id
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("completeState", request.getParameter("completeState"));// 已完成// 未完成
		param.put("templateName", request.getParameter("templateName"));// 试卷模版名称
        param.put("type",type);
		initPage(request, param);
		
		int personCompanyId = 0;
		String name = "";
		if("0".equals(type)){
			//获取企业类别id
			personCompanyId = dictionaryService.selectEnterpriseTypeIdByEnterpriseUserId(Integer.valueOf(personId));
			if(personCompanyId==-1){
				return ResultUtil.appJsonObject(false,"人员不存");
			}
			name = physicalService.selectEnterpriseUserById(Integer.valueOf(personId)).getName();
		}else{
			PersonInfo personInfo = personInfoService.findPersonInfo(Integer.valueOf(personId));
			if(personInfo==null){
				return ResultUtil.appJsonObject(false,"人员不存");
			}
			personCompanyId = personInfo.getPersonCompanyId();
			name = personInfo.getPersonName();
		}
		param.put("personId", personId);
		param.put("personCompanyId", personCompanyId);
		param.put("name", name);
		List<Map<String, Object>> data = examinationService.findMyExamination(param);
		for (Map<String, Object> map : data) {
			if (map.get("publishTime") != null) {
				map.put("publishTime", DateUtil.dateToString((Date) map.get("publishTime"), "yyyy-MM-dd hh:mm:ss"));
			} else {
				map.put("publishTime", "");
			}
			if (map.get("completeTime") != null) {
				map.put("completeTime", DateUtil.dateToString((Date) map.get("completeTime"), "yyyy-MM-dd hh:mm:ss"));
			} else {
				map.put("completeTime", "");
			}
		}
		return ResultUtil.appJsonObject(true, "", "data", data);
	}

	/**
	 * 查找试卷以及试卷答题情况
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/findExamAndMyAnswer")
	@ResponseBody
	public JSONObject findExamAndMyAnswer(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("personId", request.getParameter("personId"));// 答题人员id
		param.put("examinationId", request.getParameter("examinationId"));// 试卷id
		param.put("type", request.getParameter("type"));// (1:执法端 0:企业端)

		Map<String, Object> map = examinationService.findPersonExamScire(param);// 查找某人某试卷分数及试卷标题
		JSONObject json = new JSONObject();
		if("0".equals(param.get("type"))){
			//获取企业类别id
			int personCompanyId = dictionaryService.selectEnterpriseTypeIdByEnterpriseUserId(Integer.valueOf(request.getParameter("personId")));
			if(personCompanyId==-1){
				System.out.println("人员不存在");
			}
			param.put("personCompanyId",personCompanyId);
			List<Map<String, Object>> data = examinationService.findComExamAndMyAnswer(param);
			json.put("examList", data);
		}else {
			List<Map<String, Object>> data = examinationService.findExamAndMyAnswer(param);
			json.put("examList", data);
		}

		if (MapUtils.isNotEmpty(map)) {
			json.put("score", map.get("score"));
			json.put("templateName", map.get("templateName"));
		} else {

			json.put("score", null);
			json.put("templateName", null);
		}
		return ResultUtil.appJsonObject(true, "", "data", json);
	}

	/**
	 * 查找从业人员试卷列表
	 * 
	 * @return
	 */
	@RequestMapping("/findCongyeExamList")
	@ResponseBody
	public JSONObject findCongyeExamList(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("templateName", request.getParameter("templateName"));// 试卷模版名称
		param.put("personName", request.getParameter("personName"));// 人员名称
		param.put("completeState", request.getParameter("completeState"));// 完成状态
		initPage(request, param);
		List<Map<String, Object>> data = examinationService.findCongyeExamList(param);
		return ResultUtil.appJsonObject(true, "", "data", data);
	}

	/**
	 * 答题
	 * 
	 * @param request
	 * @param list
	 * @return
	 */
	@RequestMapping("answerExam")
	@ResponseBody
	public JSONObject answerExam(HttpServletRequest request, @RequestBody List<ExamRecord> list) {
		boolean pageResult = false;
		try {
			if (CollectionUtils.isEmpty(list))
				return ResultUtil.appJsonObject(pageResult, "答案不能为空");

			for (ExamRecord record : list) {
				if (null == record.getExamId() || 0 == record.getExamId()) {
					return ResultUtil.appJsonObject(pageResult, "试题id不能为空");
				}
				if (null == record.getExaminationId() || 0 == record.getExaminationId()) {
					return ResultUtil.appJsonObject(pageResult, "试卷id不能为空");
				}
				if (null == record.getOperatorId() || 0 == record.getOperatorId()) {
					return ResultUtil.appJsonObject(pageResult, "答题人员id不能为空");
				}
			}

			int total = examRelationService.findTotalExam(list.get(0).getExaminationId());
			if (total != list.size())
				return ResultUtil.appJsonObject(pageResult, "必须答完试卷所有试题");

			int add = examinationService.insertListRecord(list);
			if (add > 0)
				pageResult = true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return ResultUtil.appJsonObject(pageResult, "");
	}

	// app端试卷答题页面
	@RequestMapping("showAnswerExam")
	public String showAnswerExam(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("personId", request.getParameter("personId"));// 答题人员id
		param.put("examinationId", request.getParameter("examinationId"));// 试卷id
		param.put("type", request.getParameter("type"));// (1:执法端 0:企业端)
		if("0".equals(param.get("type"))){
			//获取企业类别id
			int personCompanyId = dictionaryService.selectEnterpriseTypeIdByEnterpriseUserId(Integer.valueOf(request.getParameter("personId")));
			if(personCompanyId==-1){
				System.out.println("人员不存在");
			}
			param.put("personCompanyId",personCompanyId);
			List<Map<String, Object>> data = examinationService.findComExamAndMyAnswer(param);
			request.setAttribute("dataList", data);
		}else {
			List<Map<String, Object>> data = examinationService.findExamAndMyAnswer(param);
			request.setAttribute("dataList", data);
		}
		Examination examination = examinationService
				.findExamination(Long.valueOf(request.getParameter("examinationId")));// 查找某人试卷标题
		request.setAttribute("templateName", examination.getTemplateName());
		request.setAttribute("personId", request.getParameter("personId"));
		request.setAttribute("type",request.getParameter("type"));
		request.setAttribute("examinationId", request.getParameter("examinationId"));
		//获取总答题时间
		double choiceCount = StringUtils.isBlank(examination.getChoiceCount())?0:Double.valueOf(examination.getChoiceCount());
		double judgmentCount = StringUtils.isBlank(examination.getJudgmentCount())?0:Double.valueOf(examination.getJudgmentCount());
		double completionCount = StringUtils.isBlank(examination.getCompletionCount())?0:Double.valueOf(examination.getCompletionCount());
		double choiceTime = StringUtils.isBlank(examination.getChoiceTime())?0:Double.valueOf(examination.getChoiceTime());
		double judgmentTime = StringUtils.isBlank(examination.getJudgmentTime())?0:Double.valueOf(examination.getJudgmentTime());
		double completionTime = StringUtils.isBlank(examination.getCompletionTime())?0:Double.valueOf(examination.getCompletionTime());
		
		int totalTime = ((Double)(choiceCount*choiceTime+judgmentCount*judgmentTime+completionCount*completionTime)).intValue();//秒
		request.setAttribute("totalTime", totalTime);
		return "exam/questions";
	}

	@RequestMapping("checkAnswerExam")
	public String checkAnswerExam(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("personId", request.getParameter("personId"));// 答题人员id
		param.put("examinationId", request.getParameter("examinationId"));// 试卷id
		param.put("type", request.getParameter("type"));// (1:执法端 0:企业端)
		if("0".equals(param.get("type"))){
			//获取企业类别id
			int personCompanyId = dictionaryService.selectEnterpriseTypeIdByEnterpriseUserId(Integer.valueOf(request.getParameter("personId")));
			if(personCompanyId==-1){
				System.out.println("人员不存在");
			}
			param.put("personCompanyId",personCompanyId);
			List<Map<String, Object>> data = examinationService.findComExamAndMyAnswer(param);
			request.setAttribute("dataList", data);
		}else {
			List<Map<String, Object>> data = examinationService.findExamAndMyAnswer(param);
			request.setAttribute("dataList", data);
		}

		Examination examination = examinationService
				.findExamination(Long.valueOf(request.getParameter("examinationId")));// 查找某人试卷标题
		Map<String, Object> map = examinationService.findPersonExamScire(param);// 查找某人某试卷分数
		request.setAttribute("templateName", examination == null ? "" : examination.getTemplateName());
		if (MapUtils.isNotEmpty(map)) {
			request.setAttribute("score", map.get("score"));
		} else {
			request.setAttribute("score", null);
		}
		return "exam/questionsDetail";
	}

	@RequestMapping("answer")
	@ResponseBody
	public String answer(HttpServletRequest request) {

		String personId = request.getParameter("personId");
		String examinationId = request.getParameter("examinationId");
		String type = request.getParameter("type");
		List<ExamRecord> list = new ArrayList<ExamRecord>();
		// 获取参数map
		Map<String, String[]> temp = request.getParameterMap();
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.putAll(temp);
		map.remove("personId");
		map.remove("examinationId");
		map.remove("type");
		Set set = map.keySet();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			ExamRecord examRecord = new ExamRecord();
			String id = iterator.next().toString();
			String answer = map.get(id)[0];
			examRecord.setExaminationId(Long.valueOf(examinationId));
			examRecord.setOperatorId(Integer.valueOf(personId));
			examRecord.setAnswer(answer);
			examRecord.setExamId(Long.valueOf(id));
			examRecord.setType(type);
			list.add(examRecord);
		}
		try {
			examinationService.insertListRecord(list);
		} catch (Exception ex) {
			ex.printStackTrace();
			return "提交失败";
		}
		return "提交成功";
	}

	/******************************************** 溯源管理 ********************************************************************/

	/**
	 * 产品进货台账-显示
	 */
	@RequestMapping("/selectPurchaseLedger")
	@ResponseBody
	public JSONObject selectPurchaseLedger(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", request.getParameter("startNum")==null?0:(Integer.valueOf(request.getParameter("startNum"))-1));
		map.put("limit", request.getParameter("limit"));
		//EnterpriseUser enterpriseUser=physicalService.selectEnterpriseUserByUsername(request.getParameter("username"));
		//map.put("enterpriseName", enterpriseUser==null?"":enterpriseUser.getEnterpriseName());
		map.put("enterpriseName", request.getParameter("enterpriseName"));
		map.put("reportTime", request.getParameter("reportTime"));
		map.put("commodity", request.getParameter("commodity"));//物品名称
		map.put("purchaseTime", request.getParameter("purchaseTime"));//进货时间
		if("1".equals(request.getParameter("ctype"))){
			map.put("createUser", request.getParameter("username"));
		}
		List<PurchaseLedger> result = originService.selectPurchaseLedgerApp(map);
		int num = originService.selectPurchaseLedgerTotalApp(map);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("totalCount", num);
		param.put("list", result);
		return ResultUtil.appJsonObject(true, "", "data", param);
	}

	/**
	 * 产品进货台账-添加
	 */
	@RequestMapping("/insertPurchaseLedger")
	@ResponseBody
	public JSONObject insertPurchaseLedger(HttpServletRequest request) {
		EnterpriseUser enterpriseUser=physicalService.selectEnterpriseUserByUsername(request.getParameter("username"));
		String company = enterpriseUser==null?"":enterpriseUser.getEnterpriseName();

		String commodity = request.getParameter("commodity");

		String supplyUnit = request.getParameter("supplyUnit");

		String buyer = request.getParameter("buyer");

		Date purchaseTime = null;
		try{
			purchaseTime = request.getParameter("purchaseTime")==null?null:DateUtil.stringToDate(request.getParameter("purchaseTime"));
		}catch(Exception e){
			return ResultUtil.appJsonObject(false,"进货时间格式不正确");
		}

		Date reportTime = null;
		try{
			reportTime = request.getParameter("reportTime")==null?new Date():DateUtil.stringToDate(request.getParameter("reportTime"));
		}catch(Exception e){
			return ResultUtil.appJsonObject(false,"上报时间格式不正确");
		}

		String spec = request.getParameter("spec");

		Integer num = null;
		try{
			num = request.getParameter("num")==null?null:Integer.valueOf(request.getParameter("num"));
		}catch(Exception e){
			return ResultUtil.appJsonObject(false,"数量格式不正确");
		}

		String batchNumber = request.getParameter("batchNumber");

		Date safeDate = null;
		try{
			safeDate = request.getParameter("safeDate")==null?null:DateUtil.stringToDate(request.getParameter("safeDate"));
		}catch(Exception e){
			return ResultUtil.appJsonObject(false,"保质期格式不正确");
		}

		String supplyPerson = request.getParameter("supplyPerson");

		String supplyTel = request.getParameter("supplyTel");

		String recordPerson = request.getParameter("recordPerson");

		String imgUrl = request.getParameter("imgUrl");

		String batchUnit = request.getParameter("batchUnit");

		PurchaseLedger record = new PurchaseLedger();
		record.setBatchNumber(batchNumber);
		record.setBatchUnit(batchUnit);
		record.setBuyer(buyer);
		record.setCommodity(commodity);
		record.setCompany(company);
		record.setImgUrl(imgUrl);
		record.setNum(num);
		record.setPurchaseTime(purchaseTime);
		record.setRecordPerson(recordPerson);
		record.setReportTime(reportTime);
		record.setSafeDate(safeDate);
		record.setSpec(spec);
		record.setSupplyPerson(supplyPerson);
		record.setSupplyTel(supplyTel);
		record.setSupplyUnit(supplyUnit);
		record.setCreateUser(request.getParameter("username"));
		try {
			originService.insertPurchaseLedger(record);
			return ResultUtil.appJsonObject(true, "插入成功");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultUtil.appJsonObject(false, "插入失败,后台服务报错");
		}

	}
	
	/**
	 * 产品进货台账-修改
	 */
	@RequestMapping("/updatePurchaseLedger")
	@ResponseBody
	public JSONObject updatePurchaseLedger(HttpServletRequest request) {
		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return ResultUtil.appJsonObject(false, "请传入参数产品进货台帐ID");
		}
		
		EnterpriseUser enterpriseUser=physicalService.selectEnterpriseUserByUsername(request.getParameter("username"));
		String company = enterpriseUser==null?"":enterpriseUser.getEnterpriseName();

		String commodity = request.getParameter("commodity");

		String supplyUnit = request.getParameter("supplyUnit");

		String buyer = request.getParameter("buyer");

		Date purchaseTime = null;
		try{
			purchaseTime = request.getParameter("purchaseTime")==null?null:DateUtil.stringToDate(request.getParameter("purchaseTime"));
		}catch(Exception e){
			return ResultUtil.appJsonObject(false,"进货时间格式不正确");
		}

		Date reportTime = null;
		try{
			reportTime = request.getParameter("reportTime")==null?new Date():DateUtil.stringToDate(request.getParameter("reportTime"));
		}catch(Exception e){
			return ResultUtil.appJsonObject(false,"上报时间格式不正确");
		}

		String spec = request.getParameter("spec");

		Integer num = null;
		try{
			num = request.getParameter("num")==null?null:Integer.valueOf(request.getParameter("num"));
		}catch(Exception e){
			return ResultUtil.appJsonObject(false,"数量格式不正确");
		}

		String batchNumber = request.getParameter("batchNumber");

		Date safeDate = null;
		try{
			safeDate = request.getParameter("safeDate")==null?null:DateUtil.stringToDate(request.getParameter("safeDate"));
		}catch(Exception e){
			return ResultUtil.appJsonObject(false,"保质期格式不正确");
		}

		String supplyPerson = request.getParameter("supplyPerson");

		String supplyTel = request.getParameter("supplyTel");

		String recordPerson = request.getParameter("recordPerson");

		String imgUrl = request.getParameter("imgUrl");

		String batchUnit = request.getParameter("batchUnit");

		PurchaseLedger record = new PurchaseLedger();
		record.setId(Integer.valueOf(id));
		record.setBatchNumber(batchNumber);
		record.setBatchUnit(batchUnit);
		record.setBuyer(buyer);
		record.setCommodity(commodity);
		record.setCompany(company);
		record.setImgUrl(imgUrl);
		record.setNum(num);
		record.setPurchaseTime(purchaseTime);
		record.setRecordPerson(recordPerson);
		record.setReportTime(reportTime);
		record.setSafeDate(safeDate);
		record.setSpec(spec);
		record.setSupplyPerson(supplyPerson);
		record.setSupplyTel(supplyTel);
		record.setSupplyUnit(supplyUnit);
		
		try {
			originService.updatePurchaseLedger(record);
			return ResultUtil.appJsonObject(true, "修改成功");
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}
	
	/**
	 * 产品进货台账-删除
	 */
	@RequestMapping("/deletePurchaseLedger")
	@ResponseBody
	public JSONObject deletePurchaseLedger(HttpServletRequest request, Integer id) {
		
		if (StringUtils.isBlank(id)) {
			return ResultUtil.appJsonObject(false, "请传入参数产品进货台帐ID");
		}
		try {
			originService.deletePurchaseLedger(id);
			return ResultUtil.appJsonObject(true, "删除成功");
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}

	/**
	 * 产品进货台账--findone
	 */
	@RequestMapping("/findPurchaseLedger")
	@ResponseBody
	public JSONObject findPurchaseLedger(HttpServletRequest request, Integer id) {
		PurchaseLedger purchaseLedger = originService.findPurchaseLedger(id);
		return ResultUtil.appJsonObject(true, "", "data", purchaseLedger);
	}

	/**
	 * 食品添加剂备案-显示
	 */
	@RequestMapping("/selectAdditiveFiling")
	@ResponseBody
	public JSONObject selectAdditiveFiling(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", request.getParameter("startNum"));
		map.put("company", request.getParameter("company"));
		map.put("recordTime", request.getParameter("recordTime"));
		if("1".equals(request.getParameter("ctype"))){
			map.put("createUser", request.getParameter("username"));
		}
		map.put("limit", request.getParameter("limit"));
		List<AdditiveFiling> result = originService.selectAdditiveFiling(map);
		int num = originService.selectAdditiveFilingTotal(map);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("totalCount", num);
		param.put("list", result);
		return ResultUtil.appJsonObject(true, "", "data", param);
	}

	/**
	 * 食品添加剂备案-添加
	 */
	@RequestMapping("/insertAdditiveFiling")
	@ResponseBody
	public JSONObject insertAdditiveFiling(HttpServletRequest request, AdditiveFiling record) {
        record.setCreateUser(request.getParameter("username"));
		if (StringUtils.isBlank(record.getCompany())) {
			return ResultUtil.appJsonObject(false, "请填写企业名称");
		} else if (StringUtils.isBlank(record.getCompanyAddress())) {
			return ResultUtil.appJsonObject(false, "请填写企业地址 ");
		} else if (StringUtils.isBlank(record.getLegalPerson())) {
			return ResultUtil.appJsonObject(false, "请填写法人代表");
		} else if (StringUtils.isBlank(record.getContacts())) {
			return ResultUtil.appJsonObject(false, "请填写联系人");
		} else if (StringUtils.isBlank(record.getContactsTel())) {
			return ResultUtil.appJsonObject(false, "请填写联系电话");
		} else if (StringUtils.isBlank(record.getRecordTime())) {
			return ResultUtil.appJsonObject(false, "请填写备案时间");
		} else if (StringUtils.isBlank(record.getKeeper())) {
			return ResultUtil.appJsonObject(false, "请填写验收记录员");
		} else if (StringUtils.isBlank(record.getPurchaseTime())) {
			return ResultUtil.appJsonObject(false, "请填写进货时间");
		}
		
		try{
			DateUtil.stringToDate(record.getRecordTime(),"yyyy-MM-dd HH:mm");
		}catch(Exception e){
			return ResultUtil.appJsonObject(false,"备案时间格式不正确");
		}
		try{
			DateUtil.stringToDate(record.getPurchaseTime(),"yyyy-MM-dd HH:mm");
		}catch(Exception e){
			return ResultUtil.appJsonObject(false,"进货时间格式不正确");
		}
		/*
		 * String rootPath =
		 * request.getSession().getServletContext().getRealPath("/"); String
		 * fileName = file.getOriginalFilename(); String[] strArr =
		 * fileName.split("\\."); fileName = strArr[0]+"-"+new Date().getTime()
		 * + "." + strArr[strArr.length - 1]; File targetFile = new
		 * File(rootPath + "file/", fileName); if (!targetFile.exists()) {
		 * targetFile.mkdirs(); } StringBuilder url = new StringBuilder(); // 保存
		 * try { file.transferTo(targetFile);
		 * url.append(request.getSession().getServletContext().getContextPath()+
		 * "/" + "file/" + fileName); } catch (Exception e) {
		 * e.printStackTrace(); } record.setImgUrl(url.toString());
		 */

		try {
			originService.insertAdditiveFiling(record);
			return ResultUtil.appJsonObject(true, "插入成功", "id", record.getId());
		} catch (Exception e) {
			e.printStackTrace();
			return ResultUtil.appJsonObject(false, "插入失败");
		}
	}
	
	/**
	 * 食品添加剂备案-修改
	 */
	@RequestMapping("/updateAdditiveFiling")
	@ResponseBody
	public JSONObject updateAdditiveFiling(HttpServletRequest request, AdditiveFiling record) {

		if (StringUtils.isBlank(record.getId())) {
			return ResultUtil.appJsonObject(false, "请传入参数食品添加剂备案ID");
		}else if (StringUtils.isBlank(record.getCompany())) {
			return ResultUtil.appJsonObject(false, "请填写企业名称");
		} else if (StringUtils.isBlank(record.getCompanyAddress())) {
			return ResultUtil.appJsonObject(false, "请填写企业地址 ");
		} else if (StringUtils.isBlank(record.getLegalPerson())) {
			return ResultUtil.appJsonObject(false, "请填写法人代表");
		} else if (StringUtils.isBlank(record.getContacts())) {
			return ResultUtil.appJsonObject(false, "请填写联系人");
		} else if (StringUtils.isBlank(record.getContactsTel())) {
			return ResultUtil.appJsonObject(false, "请填写联系电话");
		} else if (StringUtils.isBlank(record.getRecordTime())) {
			return ResultUtil.appJsonObject(false, "请填写备案时间");
		} else if (StringUtils.isBlank(record.getKeeper())) {
			return ResultUtil.appJsonObject(false, "请填写验收记录员");
		} else if (StringUtils.isBlank(record.getPurchaseTime())) {
			return ResultUtil.appJsonObject(false, "请填写进货时间");
		}

		try {
			originService.updateAdditiveFiling(record);
			return ResultUtil.appJsonObject(true, "修改成功");
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}
	
	/**
	 * 食品添加剂备案-删除
	 */
	@RequestMapping("/deleteAdditiveFiling")
	@ResponseBody
	public JSONObject deleteAdditiveFiling(HttpServletRequest request, Integer id) {
		
		if (StringUtils.isBlank(id)) {
			return ResultUtil.appJsonObject(false, "请传入参数食品添加剂备案ID");
		}
		try {
			originService.deleteAdditiveFiling(id);
			return ResultUtil.appJsonObject(true, "删除成功");
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}

	/**
	 * 备案登记表-findone/食品添加剂备案详情
	 */
	@RequestMapping("/findAdditiveFiling")
	@ResponseBody
	public JSONObject findAdditiveFiling(HttpServletRequest request, Integer id) {
		AdditiveFiling additiveFiling = originService.findAdditiveFiling(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("additivefilingId", request.getParameter("id"));
		map.put("additivesName", request.getParameter("additivesName"));
		map.put("purchaseTime", request.getParameter("purchaseTime"));
		List<KeepRecord> result = originService.selectKeepRecord(map);
		if (result.size() > 0) {
			additiveFiling.setKeepRecordList(result);
		}
		return ResultUtil.appJsonObject(true, "", "data", additiveFiling);
	}

	/**
	 * 备案登记表-添加
	 */
	@RequestMapping("/insertKeepRecord")
	@ResponseBody
	public JSONObject insertKeepRecord(HttpServletRequest request, KeepRecord record) {

		if (StringUtils.isBlank(record.getAdditivesName())) {
			return ResultUtil.appJsonObject(false, "请填写食品添加剂名称");
		} else if (StringUtils.isBlank(record.getImplementationStandards())) {
			return ResultUtil.appJsonObject(false, "请填写添加剂执行标准 ");
		} else if (StringUtils.isBlank(record.getProductCompany())) {
			return ResultUtil.appJsonObject(false, "请填写添加剂生产单位");
		} else if (StringUtils.isBlank(record.getSellCompany())) {
			return ResultUtil.appJsonObject(false, "请填写添加剂经销单位");
		} else if (StringUtils.isBlank(record.getAcceptanceMethod())) {
			return ResultUtil.appJsonObject(false, "请填写进货验收方");
		} else if (StringUtils.isBlank(record.getPurpose())) {
			return ResultUtil.appJsonObject(false, "请填写用于何种食品及添加量");
		} else if (StringUtils.isBlank(record.getAdditivefilingId())) {
			return ResultUtil.appJsonObject(false, "后台需要获取食品添加剂ID");
		}

		try {
			originService.insertKeepRecord(record);
			return ResultUtil.appJsonObject(true, "插入成功");
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}

	}
	
	/**
	 * 备案登记表-修改
	 */
	@RequestMapping("/updateKeepRecord")
	@ResponseBody
	public JSONObject updateKeepRecord(HttpServletRequest request, KeepRecord record) {

		if (StringUtils.isBlank(record.getAdditivesName())) {
			return ResultUtil.appJsonObject(false, "请填写食品添加剂名称");
		} else if (StringUtils.isBlank(record.getImplementationStandards())) {
			return ResultUtil.appJsonObject(false, "请填写添加剂执行标准 ");
		} else if (StringUtils.isBlank(record.getProductCompany())) {
			return ResultUtil.appJsonObject(false, "请填写添加剂生产单位");
		} else if (StringUtils.isBlank(record.getSellCompany())) {
			return ResultUtil.appJsonObject(false, "请填写添加剂经销单位");
		} else if (StringUtils.isBlank(record.getAcceptanceMethod())) {
			return ResultUtil.appJsonObject(false, "请填写进货验收方");
		} else if (StringUtils.isBlank(record.getPurpose())) {
			return ResultUtil.appJsonObject(false, "请填写用于何种食品及添加量");
		} else if (StringUtils.isBlank(record.getAdditivefilingId())) {
			return ResultUtil.appJsonObject(false, "后台需要获取食品添加剂ID");
		}

		try {
			originService.updateKeepRecord(record);
			return ResultUtil.appJsonObject(true, "修改成功");
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}

	}
	
	/**
	 * 备案登记表-删除
	 */
	@RequestMapping("/deleteKeepRecord")
	@ResponseBody
	public JSONObject deleteKeepRecord(HttpServletRequest request, Integer id) {
		
		if (StringUtils.isBlank(id)) {
			return ResultUtil.appJsonObject(false, "请传入参数备案登记表ID");
		}
		try {
			originService.deleteKeepRecord(id);
			return ResultUtil.appJsonObject(true, "删除成功");
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}
	

	@RequestMapping("/getNotitication")
	@ResponseBody
	public JSONObject getNotitication(HttpServletRequest request, String username) {
		List<Notification> list = notificationService.selectNotificationApp(username);
		if (CollectionUtils.isEmpty(list)) {
			return ResultUtil.appJsonObject(false, "公告为空");
		} else {
			return ResultUtil.appJsonObject(true, "", "data", list);
		}
	}

	@RequestMapping("/getDictionary")
	@ResponseBody
	public JSONObject getDictionary(Integer type) {
		List<Dictionary> dictionaryList = dictionaryService.getDictionaryByType(type);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (Dictionary dictionary : dictionaryList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("code", dictionary.gettDictionaryCode());
			map.put("name", dictionary.gettDictionaryName());
			list.add(map);
		}
		if (CollectionUtils.isEmpty(list)) {
			return ResultUtil.appJsonObject(false, "查询失败");
		} else {
			return ResultUtil.appJsonObject(true, "", "data", list);
		}
	}
	
	/**
	 * 获取所有企业名称
	 * @Description: TODO
	 * @author kongjiang
	 * @date 2017年3月30日 下午4:25:35
	 * @return
	 */
	@RequestMapping("/getEnterpriseInfoName")
	@ResponseBody
	public JSONObject getEnterpriseInfoName(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("enterpriseType", request.getParameter("enterpriseType"));
		List<Map<String, Object>> result = appService.selectEnterpriseInfoName(map);
		return ResultUtil.appJsonObject(true, "", "data", result);
	}
	
	/**
	 * 根据企业名称获取企业详细信息
	 * @param request
	 * @return
	 */
	@RequestMapping("getEnterpriseByName")
	@ResponseBody
	public JSONObject getEnterpriseByName(HttpServletRequest request) {
		String enterpriseName = request.getParameter("enterpriseName");
		if(StringUtils.isBlank(enterpriseName)){
			return ResultUtil.appJsonObject(false, "企业名称不能为空");
		}
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("enterpriseName", request.getParameter("enterpriseName"));
		try {
			List<Map<String, Object>> data = enterpriseService.selectEnterpriseInfo(param);
			JSONArray array = new JSONArray();
			for (int i = 0; i < data.size(); i++) {
				Map<String, Object> map = data.get(i);
				EnterpriseInfo info = new EnterpriseInfo();
				info.setId(Integer.parseInt(map.get("id").toString()));
				info.setAddress(map.get("addressName") == null ? "" : map.get("addressName").toString());
				info.setQyname(map.get("qyname") == null ? "" : map.get("qyname").toString());
				info.setScpermit(map.get("scpermit") == null ? "" : map.get("scpermit").toString());
				info.setYouxiaodate(map.get("youxiaodate") == null ? "" : map.get("youxiaodate").toString());
				info.setScaddress(map.get("scaddress") == null ? "" : map.get("scaddress").toString());
				if (map.get("enterpriseType").toString().equals("enterprise_1")) {
					info.setEnterpriseType("食用农产品经营户");
				} else if (map.get("enterpriseType").toString().equals("enterprise_2")) {
					info.setEnterpriseType("食品生产企业");
				} else if (map.get("enterpriseType").toString().equals("enterprise_3")) {
					info.setEnterpriseType("食品销售企业");
				} else if (map.get("enterpriseType").toString().equals("enterprise_4")) {
					info.setEnterpriseType("食品餐饮企业");
				} else if (map.get("enterpriseType").toString().equals("enterprise_5")) {
					info.setEnterpriseType("食品五小行业");
				} else if (map.get("enterpriseType").toString().equals("enterprise_6")) {
					info.setEnterpriseType("酒类销售企业");
				} else if (map.get("enterpriseType").toString().equals("enterprise_7")) {
					info.setEnterpriseType("保健食品销售企业");
				} else if (map.get("enterpriseType").toString().equals("enterprise_8")) {
					info.setEnterpriseType("化妆品销售企业");
				} else if (map.get("enterpriseType").toString().equals("enterprise_9")) {
					info.setEnterpriseType("药品零售企业");
				} else if (map.get("enterpriseType").toString().equals("enterprise_10")) {
					info.setEnterpriseType("医疗器械销售企业");
				} else if (map.get("enterpriseType").toString().equals("enterprise_11")) {
					info.setEnterpriseType("医疗器械使用企业");
				}
				info.setQydelegate(map.get("qydelegate").toString());
				info.setQyphone(map.get("qyphone").toString());
				info.setZzcode(map.get("zzcode").toString());
				array.add(info);
			}
			return ResultUtil.appJsonObject(true, "", "data", array);
		} catch (Exception e) {
			return ResultUtil.appJsonObject(false, e.getMessage());
		}
	}
}
