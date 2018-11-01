package com.foodregulation.controller.samplingInspection;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import cn.tslanpu.test.admin.domain.Admin;

import cn.tslanpu.test.utils.OSS;
import com.alibaba.fastjson.JSONObject;
import com.aliyun.oss.OSSClient;
import com.foodregulation.dao.entity.SampTaskSelEnt;
import com.foodregulation.dao.entity.SampTaskVo;
import com.foodregulation.dao.entity.SamplingTask;
import com.foodregulation.util.Constant;
import com.foodregulation.util.ResultUtil;
import com.foodregulation.util.SamplingType;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.dao.entity.SamplingInspection;
import com.foodregulation.page.PageResultVo;
import com.foodregulation.service.samplingInspection.SamplingInspectionService;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author dxl 抽样检查controller
 */
@Controller
@RequestMapping("/samplingInspection")
public class SamplingInspectionController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	SamplingInspectionService samplingInspectionService;

	@RequestMapping("/index")
	public String samplingInspectionIndex() {
		return "samplingInspection/samplingInspectionIndex";
	}

	@RequestMapping("/preAdd")
	public String samplingPreAdd() {
		return "samplingInspection/chooseSample";
	}

	@RequestMapping("/jump")
	public String jump(HttpServletRequest request, String url) {
		return "samplingInspection/" + url;
	}
	@RequestMapping("/jumpPrint")
	public String jumpPrint(HttpServletRequest request, String url) {
		return "samplingInspection/" + url;
	}

	@RequestMapping("/addTask")
	public String addTask() {
		return "samplingInspection/addSamplingTask";
	}

	@RequestMapping("/getSamplingInspectionList")
	@ResponseBody
	public PageResultVo<SamplingInspection> getSamplingInspectionList(HttpServletRequest request, Integer pageIndex,
			Integer pageSize, String operateTime, SamplingInspection samplingInspection) {
		PageResultVo<SamplingInspection> pageResultVo = new PageResultVo<SamplingInspection>();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		if (!StringUtils.isEmpty(operateTime)) {
			operateTime = operateTime.replace("年/", "-").replace("月/", "-").replace("日", "");
			try {
				samplingInspection.setCreateTime(dateFormat.parse(operateTime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		pageIndex = (pageIndex - 1) * pageSize;
		List<SamplingInspection> list = samplingInspectionService.getSamplingInspectionList(samplingInspection,
				pageIndex, pageSize);
		Integer count = samplingInspectionService.getSamplingInspectionListCount(samplingInspection);
		pageResultVo.setErrorCode(200);
		pageResultVo.setResult(list);
		pageResultVo.setCount(count);
		pageResultVo.setMsg("操作成功");
		return pageResultVo;
	}

	@RequestMapping("/deleteSamplingInspectionById")
	@ResponseBody
	public Integer deleteSamplingInspectionById(HttpServletRequest request, Long samplingInspectionId) {
		return samplingInspectionService.deleteSamplingInspectionById(samplingInspectionId);
	}

	@RequestMapping("/addSamplingInspection")
	@ResponseBody
	public JSONObject addSamplingInspection(HttpServletRequest request, SamplingInspection samplingInspection) {

		boolean pageResult = false;
		try {
			Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");

			if (StringUtils.isBlank(samplingInspection.getBusinessCategory())
					|| StringUtils.isBlank(samplingInspection.getBusinessCategoryName())) {
				return ResultUtil.jsonObject("false", "企业类别不能为空!");
			}

			if (StringUtils.isBlank(samplingInspection.getSamplingUnit())) {
				return ResultUtil.jsonObject("false", "被抽样单位不能为空!");
			}

			if (samplingInspection.getFormType() == 1 && StringUtils.isBlank(samplingInspection.getArea())) {
				return ResultUtil.jsonObject("false", "行政区域不能为空!");
			}
			if (samplingInspection.getFormType() == 1 && StringUtils.isBlank(samplingInspection.getSupervisory())) {
				return ResultUtil.jsonObject("false", "监管单位不能为空!");
			}

			samplingInspection.setOperatorId(admin == null ? 0 : (long) admin.getId());
			samplingInspection.setOperatorName(admin == null ? "" : admin.getUsername());
			samplingInspection.setCreateTime(new Date());
			samplingInspection.setModifyTime(new Date());
			samplingInspection.setResult(StringUtils.equals("合格", samplingInspection.getResult()) ? "1" : "0");

			if (StringUtils.isNotBlank(samplingInspection.getCheckDateStr())) {
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				samplingInspection.setCheckDate(dateFormat.parse(samplingInspection.getCheckDateStr()));
			}

			Integer result = samplingInspectionService.addSamplingInspection(samplingInspection);
			if (result > 0) {
				pageResult = true;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			logger.error("新增抽样检查失败", ex);
		}

		return ResultUtil.jsonObject(pageResult ? "true" : "false", "");
	}

	@RequestMapping("/save")
	@ResponseBody
	public JSONObject save(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
		String url = null;
		try {

			String fileName = file.getOriginalFilename();
			String[] strArr = fileName.split("\\.");

			String ext = strArr[strArr.length - 1];
			if (ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("bmp")
					|| ext.equalsIgnoreCase("jpeg") || ext.equalsIgnoreCase("'gif")) {

				url = new Date().getTime() + file.getOriginalFilename();
				OSSClient ossClient = OSS.getOssClient();
				ossClient.putObject(OSS.bucketName, url, file.getInputStream());
				ossClient.shutdown();

			}
		} catch (Exception ex) {
			logger.error("上传附件失败", ex);
		}
		JSONObject js = new JSONObject();
		js.put("url", url);

		return js;
	}

	@RequestMapping("/updateSamplingInspection")
	@ResponseBody
	public JSONObject updateSamplingInspection(HttpServletRequest request, SamplingInspection samplingInspection) {

		boolean pageResult = false;
		try {
			Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");

			if (StringUtils.isBlank(samplingInspection.getBusinessCategory())
					|| StringUtils.isBlank(samplingInspection.getBusinessCategoryName())) {
				return ResultUtil.jsonObject("false", "企业类别不能为空!");
			}

			if (StringUtils.isBlank(samplingInspection.getSamplingUnit())) {
				return ResultUtil.jsonObject("false", "被抽样单位不能为空!");
			}
			if (samplingInspection.getFormType() == 1 && StringUtils.isBlank(samplingInspection.getArea())) {
				return ResultUtil.jsonObject("false", "行政区域不能为空!");
			}
			if (samplingInspection.getFormType() == 1 && StringUtils.isBlank(samplingInspection.getSupervisory())) {
				return ResultUtil.jsonObject("false", "监管单位不能为空!");
			}

			samplingInspection.setOperatorId(admin == null ? 0 : (long) admin.getId());
			samplingInspection.setOperatorName(admin == null ? "" : admin.getUsername());
			samplingInspection.setModifyTime(new Date());
			samplingInspection.setResult(StringUtils.equals("合格", samplingInspection.getResult()) ? "1" : "0");

			Integer result = samplingInspectionService.updateSamplingInspection(samplingInspection);
			if (result > 0) {
				pageResult = true;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return ResultUtil.jsonObject(pageResult ? "true" : "false", "");
	}

	@RequestMapping("/getSamplingInspectionById")
	@ResponseBody
	public SamplingInspection getSamplingInspectionById(HttpServletRequest request, Long samplingInspectionId) {
		return samplingInspectionService.getSamplingInspectionById(samplingInspectionId);
	}

	@RequestMapping("/samplingTask")
	public String samplingTask() {
		return "samplingInspection/samplingTask";
	}

	/**
	 * 抽样检查任务列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/findSampTaskList")
	@ResponseBody
	public List<Map<String, Object>> findSampTaskList(HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("enterpriseType", request.getParameter("enterpriseType"));
		param.put("enterpriseName", request.getParameter("enterpriseName"));
		param.put("startCalenderOne", request.getParameter("startCalenderOne"));
		param.put("endCalenderOne", request.getParameter("endCalenderOne"));
		if (admin == null) {
			param.put("unitCode", request.getParameter("unitCode"));
		} else {
			if (!Constant.ADMIN.equals(admin.getUsername())) {
				param.put("unitCode", request.getParameter("unitCode"));
			}
		}
		param.put("startNum", request.getParameter("startNum"));
		param.put("limit", request.getParameter("limit"));
		return samplingInspectionService.findSampTaskList(param);
	}

	/**
	 * 抽样检查任务数量
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/findSampTaskListTotal")
	@ResponseBody
	public long findSampTaskListTotal(HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("enterpriseType", request.getParameter("enterpriseType"));
		param.put("enterpriseName", request.getParameter("enterpriseName"));
		param.put("startCalenderOne", request.getParameter("startCalenderOne"));
		param.put("endCalenderOne", request.getParameter("endCalenderOne"));
		if (admin == null) {
			param.put("unitCode", request.getParameter("unitCode"));
		} else {
			if (!Constant.ADMIN.equals(admin.getUsername())) {
				param.put("unitCode", request.getParameter("unitCode"));
			}
		}
		param.put("enterpriseName", request.getParameter("enterpriseName"));

		return samplingInspectionService.findSampTaskListTotal(param);
	}

	/**
	 * 新增抽样检查任务
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addSampTaskList")
	@ResponseBody
	public JSONObject addSampTaskList(HttpServletRequest request, SampTaskVo sampTaskVo) {
		boolean pageResult = false;
		try {
			String json = sampTaskVo.getListJson();
			if (StringUtils.isBlank(json)) {
				return ResultUtil.appJsonObject(false, "选择的企业不能为空");
			}
			if (StringUtils.isBlank(sampTaskVo.getUnitCode())) {
				return ResultUtil.jsonObject("false", "委托单位编码不能为空");
			}
			if (StringUtils.isBlank(sampTaskVo.getUnitName())) {
				return ResultUtil.jsonObject("false", "委托单位名称不能为空");
			}

			if (StringUtils.isBlank(sampTaskVo.getCheckStartDateStr())) {
				return ResultUtil.jsonObject("false", "检查开始日期不能为空");
			}
			if (StringUtils.isBlank(sampTaskVo.getCheckEndDateStr())) {
				return ResultUtil.jsonObject("false", "检查结束日期不能为空");
			}

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			String physicalDateStr = sampTaskVo.getCheckStartDateStr().replace("年/", "-").replace("月/", "-")
					.replace("日", "");
			sampTaskVo.setCheckStartDate(dateFormat.parse(physicalDateStr));

			String reportDateStr = sampTaskVo.getCheckEndDateStr().replace("年/", "-").replace("月/", "-").replace("日",
					"");
			sampTaskVo.setCheckEndDate(dateFormat.parse(reportDateStr));

			List<SampTaskSelEnt> list = com.alibaba.fastjson.JSONObject.parseArray(json, SampTaskSelEnt.class);
			sampTaskVo.setList(list);

			Map<Integer, Map<String, String>> map = new HashMap<Integer, Map<String, String>>();
			for (SampTaskSelEnt ent : list) {
				if (map.containsKey(ent.getEnterpriseId())) {
					map.get(ent.getEnterpriseId()).put(ent.getEnterpriseType(), ent.getBatch());
				} else {
					Map<String, String> m = new HashMap<String, String>();
					m.put(ent.getEnterpriseType(), ent.getBatch());
					map.put(ent.getEnterpriseId(), m);
				}

			}

			List<SamplingTask> samplingTaskList = new ArrayList<SamplingTask>();
			for (Integer entId : map.keySet()) {
				for (String type : map.get(entId).keySet()) {

					SamplingTask task = new SamplingTask();
					task.setCheckStartDate(sampTaskVo.getCheckStartDate());
					task.setCheckEndDate(sampTaskVo.getCheckEndDate());
					task.setBatch(map.get(entId).get(type));
					task.setEnterpriseType(type);
					task.setEnterpriseId(entId);
					// 根据企业类型设置表单类型
					task.setSamplingType(SamplingType.getSamplingType(type));
					task.setUnitCode(sampTaskVo.getUnitCode());
					task.setUnitName(sampTaskVo.getUnitName());
					task.setCheckDate(physicalDateStr + " - " + reportDateStr);
					samplingTaskList.add(task);
				}
			}

			int i = samplingInspectionService.addSampTaskList(samplingTaskList);
			if (i > 0) {
				pageResult = true;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return ResultUtil.jsonObject(pageResult ? "true" : "false", "");
	}

	/**
	 * 删除抽样检查任务
	 * 
	 * @param request
	 * @param taskId
	 * @return
	 */
	@RequestMapping("/delSampTask")
	@ResponseBody
	public Integer delSampTask(HttpServletRequest request, Long taskId) {
		return samplingInspectionService.delSampTask(taskId);
	}
}
