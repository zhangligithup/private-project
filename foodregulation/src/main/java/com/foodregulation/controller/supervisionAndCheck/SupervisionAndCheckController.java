package com.foodregulation.controller.supervisionAndCheck;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.aliyun.oss.OSSClient;
import com.foodregulation.dao.entity.InspectionRecord;
import com.foodregulation.dao.entity.Notice;
import com.foodregulation.dao.entity.Proposal;
import com.foodregulation.dao.entity.SupervisionAndCheck;
import com.foodregulation.dao.entity.SupervisionAndCheckTask;
import com.foodregulation.service.supervisionAndCheck.SupervisionAndCheckService;
import com.foodregulation.util.Constant;
import com.foodregulation.util.ObjectConvertToMap;
import com.foodregulation.util.ResultUtil;
import com.foodregulation.util.WordUtil;
import com.itextpdf.text.DocumentException;

import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.utils.OSS;
import freemarker.core.ParseException;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.TemplateNotFoundException;

@Controller
@RequestMapping("supervisionAndCheck")
public class SupervisionAndCheckController {
	@Autowired
	private SupervisionAndCheckService supervisionAndCheckService;

	@RequestMapping("show")
	public String show(HttpServletRequest request, Integer taskId) {
		request.setAttribute("taskId", taskId);
		return "supervisionAndCheck/supervisionAndCheck";
	}

	@RequestMapping("taskShow")
	public String taskShow(HttpServletRequest request) {
		return "supervisionAndCheck/supervisionAndCheckTask";
	}

	@RequestMapping("addShow")
	public String addShow(HttpServletRequest request, String enterpriseTypeCode) {
		String url = "";
		String dealTaskId = request.getParameter("dealTaskId");
		String checkDate = request.getParameter("checkDate");
		String unitcode = request.getParameter("unitcode");
		String enterpriseName = request.getParameter("enterpriseName");
		String enterpriseTypeName = "";
		switch (enterpriseTypeCode) {
		case "enterprise_2":
			url = "supervisionAndCheckProduction";
			break;// 食品生产
		case "enterprise_1":
			url = "supervisionAndCheckCriculate";
			enterpriseTypeName = "食品小摊点经营户";
			break;// 食品小摊点经营户
		case "enterprise_3":
			url = "supervisionAndCheckCriculate";
			enterpriseTypeName = "食品销售";
			break;// 食品销售企业
		case "enterprise_4":
			url = "supervisionAndCheckFood";
			break;// 食品餐饮企业
		case "enterprise_6":
			url = "supervisionAndCheckWine";
			break;// 酒类销售企业
		case "enterprise_7":
			url = "supervisionAndCheckHealth";
			break;// 保健食品销售企业
		case "enterprise_8":
			url = "supervisionAndCheckCosmetic";
			break;// 化妆品销售企业
		case "enterprise_9":
			url = "supervisionAndCheckDrug";
			break;// 药品零售企业
		case "enterprise_10":
			url = "supervisionAndCheckMedical";
			break;// 医疗器械销售企业
		case "enterprise_11":
			url = "supervisionAndCheckUsemed";
			break;// 医疗器械使用企业
		}
		request.setAttribute("dealTaskId", dealTaskId);
		request.setAttribute("checkDate", checkDate);
		request.setAttribute("unitcode", unitcode);
		request.setAttribute("enterpriseName", enterpriseName);
		request.setAttribute("enterpriseTypeName", enterpriseTypeName);
		request.setAttribute("enterpriseTypeCode", enterpriseTypeCode);
		return "supervisionAndCheck/" + url;
	}

	@RequestMapping("selectSupervisionCheck")
	@ResponseBody
	public List<SupervisionAndCheck> selectSupervisionCheck(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("enterpriseName", request.getParameter("enterpriseName"));
		param.put("enterpriseType", request.getParameter("enterpriseType"));
		param.put("checkDate", request.getParameter("checkDate"));
		param.put("checkUnitCode", request.getParameter("checkUnitCode"));
		param.put("address", request.getParameter("address"));
		param.put("taskId", request.getParameter("taskId"));
		param.put("startNum", request.getParameter("startNum"));
		param.put("limit", request.getParameter("limit"));
		return supervisionAndCheckService.selectSupervisionCheck(param);
	}

	@RequestMapping("selectSupervisionCheckTotal")
	@ResponseBody
	public int selectSupervisionCheckTotal(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("enterpriseName", request.getParameter("enterpriseName"));
		param.put("enterpriseType", request.getParameter("enterpriseType"));
		param.put("checkDate", request.getParameter("checkDate"));
		param.put("checkUnitCode", request.getParameter("checkUnitCode"));
		param.put("address", request.getParameter("address"));
		param.put("taskId", request.getParameter("taskId"));
		return supervisionAndCheckService.selectSupervisionCheckTotal(param);
	}

	@RequestMapping("add")
	@ResponseBody
	public int add(HttpServletRequest request, SupervisionAndCheck supervisionAndCheck)
			throws FileNotFoundException, IOException {
		return supervisionAndCheckService.add(supervisionAndCheck);
	}

	@RequestMapping("getSupervisionAndCheckByKey")
	@ResponseBody
	public SupervisionAndCheck getSupervisionAndCheckByKey(int id) {
		SupervisionAndCheck supervisionAndCheck = supervisionAndCheckService.selectByPrimaryKey(id);
		return supervisionAndCheck;
	}

	@RequestMapping("del")
	@ResponseBody
	public int del(Integer id) {
		return supervisionAndCheckService.del(id);
	}

	@RequestMapping("query")
	public String query(HttpServletRequest request, int id, String type) {
		SupervisionAndCheck supervisionAndCheck = supervisionAndCheckService.selectByPrimaryKey(id);
		request.setAttribute("supervisionAndCheck", supervisionAndCheck);
		String url = "";
		String enterpriseTypeName = "";
		switch (type) {
		case "enterprise_2":
			url = "supervisionAndCheckProductionQuery";
			break;
		case "enterprise_3":
			url = "supervisionAndCheckCriculateQuery";
			enterpriseTypeName = "食品销售";
			break;
		case "enterprise_1":
			url = "supervisionAndCheckCriculateQuery";
			enterpriseTypeName = "食品小摊点经营户";
			break;
		case "enterprise_4":
			url = "supervisionAndCheckFoodQuery";
			break;
		case "enterprise_6":
			url = "supervisionAndCheckWineQuery";
			break;
		case "enterprise_7":
			url = "supervisionAndCheckHealthQuery";
			break;
		case "enterprise_8":
			url = "supervisionAndCheckCosmeticQuery";
			break;
		case "enterprise_9":
			url = "supervisionAndCheckDrugQuery";
			break;
		case "enterprise_10":
			url = "supervisionAndCheckMedicalQuery";
			break;
		case "enterprise_11":
			url = "supervisionAndCheckUsemedQuery";
			break;
		}
		;
		request.setAttribute("enterpriseTypeName", enterpriseTypeName);
		request.setAttribute("enterpriseTypeCode", type);
		return "supervisionAndCheck/" + url;
	}

	@RequestMapping("update")
	@ResponseBody
	public int update(SupervisionAndCheck supervisionAndCheck) {
		return supervisionAndCheckService.update(supervisionAndCheck);
	}

	/**
	 * 添加现场检查笔录
	 * 
	 * @Title: insertInspectionRecord
	 * @Description: TODO
	 * @author: kongjiang
	 * @param request
	 * @param record
	 * @return
	 */
	@RequestMapping("insertInspectionRecord")
	@ResponseBody
	public int insertInspectionRecord(HttpServletRequest request, InspectionRecord record) {
		int num = supervisionAndCheckService.insertInspectionRecord(record);
		if (num > 0) {
			return record.getId();
		} else {
			return -1;
		}
	}

	/**
	 * 查看现场检查笔录
	 * 
	 * @Title: findInspectionRecord
	 * @Description: TODO
	 * @author: kongjiang
	 * @param id
	 * @return
	 */
	@RequestMapping("findInspectionRecord")
	@ResponseBody
	public InspectionRecord findInspectionRecord(int id) {
		InspectionRecord inspectionRecord = supervisionAndCheckService.findInspectionRecord(id);
		String checkStartTime = inspectionRecord.getCheckStartTime();
		String checkEndTime = inspectionRecord.getCheckEndTime();
		inspectionRecord.setYear(checkStartTime.substring(0, 4));
		inspectionRecord.setMouth(checkStartTime.substring(5, 7));
		inspectionRecord.setDay(checkStartTime.substring(8, 10));
		inspectionRecord.setStartHour(checkStartTime.substring(12, 14));
		inspectionRecord.setStartMinute(checkStartTime.substring(15, 17));
		inspectionRecord.setEndHour(checkEndTime.substring(12, 14));
		inspectionRecord.setEndMinute(checkEndTime.substring(15, 17));
		return inspectionRecord;
	}

	/**
	 * 生成现场检查笔录pdf并返回url
	 * 
	 * @param id
	 * @return
	 * @throws DocumentException
	 * @throws IOException
	 */
	@RequestMapping("getInspectionRecordPdfUrl")
	@ResponseBody
	public String getInspectionRecordPdfUrl(int id,String type) throws IOException, DocumentException {
		Map<String, Object> map = supervisionAndCheckService.selectInspectionRecordPdfDataById(id);
		if (map == null || map.size() == 0) {
			return "";
		}
		String checkPersonName = map.get("checkPersonName")==null?"":map.get("checkPersonName").toString();
		if(checkPersonName.equals(",")){
			checkPersonName = checkPersonName.replace(",", "");
		}else{
			checkPersonName = checkPersonName.replace(",", "、");
		}
		map.put("checkPersonName", checkPersonName);
		String checkPersonCode = map.get("checkPersonCode")==null?"":map.get("checkPersonCode").toString();
		if(checkPersonCode.equals(",")){
			checkPersonCode = checkPersonCode.replace(",", "");
		}else{
			checkPersonCode = checkPersonCode.replace(",", "、");
		}
		map.put("checkPersonCode", checkPersonCode);
		String url = map.get("url")==null?"":map.get("url").toString();
		if (StringUtils.isNotBlank(url)&&"0".equals(type)) {
			return url;
		} else {
			Object checkStartTime = map.get("check_start_time");
			Object checkEndTime = map.get("check_end_time");
			if (checkStartTime != null && StringUtils.isNotBlank(checkStartTime.toString())) {
				DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				LocalDateTime localDateTime = LocalDateTime.parse(checkStartTime.toString().substring(0, 19),
						dateTimeFormatter);
				map.put("year", localDateTime.getYear());
				map.put("month", localDateTime.getMonthValue());
				map.put("day", localDateTime.getDayOfMonth());
				map.put("startHour", localDateTime.getHour());
				map.put("startMinute", localDateTime.getMinute());
			}
			if (checkEndTime != null && StringUtils.isNotBlank(checkEndTime.toString())) {
				DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				LocalDateTime localDateTime = LocalDateTime.parse(checkEndTime.toString().substring(0, 19),
						dateTimeFormatter);
				map.put("endHour", localDateTime.getHour());
				map.put("endMinute", localDateTime.getMinute());
			}
			url = WordUtil.getPdfAndUpload(map, "现场检查笔录.pdf");
			InspectionRecord temp = new InspectionRecord();
			temp.setId(Integer.valueOf(map.get("id").toString()));
			temp.setUrl(url);
			supervisionAndCheckService.updateInspectionRecord(temp);
			return url;
		}
	}

	/**
	 * 删除现场检查笔录
	 * 
	 * @Title: deleteInspectionRecord
	 * @Description: TODO
	 * @author: kongjiang
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteInspectionRecord")
	@ResponseBody
	public int deleteInspectionRecord(int id) {
		return supervisionAndCheckService.deleteInspectionRecord(id);
	}

	/**
	 * 修改现场检查笔录
	 * 
	 * @Title: updateInspectionRecord
	 * @Description: TODO
	 * @author: kongjiang
	 * @param request
	 * @param record
	 * @return
	 */
	@RequestMapping("updateInspectionRecord")
	@ResponseBody
	public int updateInspectionRecord(HttpServletRequest request, InspectionRecord record) {
		int num = supervisionAndCheckService.updateInspectionRecord(record);
		return num;
	}

	/**
	 * 打印现场检查笔录
	 * 
	 * @Title: printInspectionRecord
	 * @Description: TODO
	 * @author: kongjiang
	 * @param id
	 * @return
	 * @throws IOException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws ParseException
	 * @throws MalformedTemplateNameException
	 * @throws TemplateNotFoundException
	 */
	@RequestMapping("printInspectionRecord")
	public void printInspectionRecord(HttpServletRequest request, HttpServletResponse response, int id)
			throws TemplateNotFoundException, MalformedTemplateNameException, ParseException, IllegalArgumentException,
			IllegalAccessException, IOException {
		InspectionRecord inspectionRecord = supervisionAndCheckService.findInspectionRecord(id);
		String checkStartTime = inspectionRecord.getCheckStartTime();
		String checkEndTime = inspectionRecord.getCheckEndTime();
		inspectionRecord.setYear(checkStartTime.substring(0, 4));
		inspectionRecord.setMouth(checkStartTime.substring(5, 7));
		inspectionRecord.setDay(checkStartTime.substring(8, 10));
		inspectionRecord.setStartHour(checkStartTime.substring(11, 13));
		inspectionRecord.setStartMinute(checkStartTime.substring(14, 16));
		inspectionRecord.setEndHour(checkEndTime.substring(11, 13));
		inspectionRecord.setEndMinute(checkEndTime.substring(14, 16));
		request.setAttribute("inspectionRecord", inspectionRecord);

		File file = null;
		InputStream fin = null;
		ServletOutputStream out = null;
		String fileName = new String("现场检查笔录.doc".getBytes("UTF-8"), "iso-8859-1");
		try {
			// 调用工具类WordGenerator的createDoc方法生成Word文档
			file = WordUtil.createDoc(ObjectConvertToMap.getMapFromObject(inspectionRecord), 0);
			fin = new FileInputStream(file);

			response.setCharacterEncoding("utf-8");
			response.setContentType("application/x-msdownload;");
			// 设置浏览器以下载的方式处理该文件默认名为resume.doc
			response.addHeader("Content-Disposition", "attachment;filename=" + fileName);

			out = response.getOutputStream();
			byte[] buffer = new byte[512]; // 缓冲区
			int bytesToRead = -1;
			// 通过循环将读入的Word文件的内容输出到浏览器中
			while ((bytesToRead = fin.read(buffer)) != -1) {
				out.write(buffer, 0, bytesToRead);
			}
		} finally {
			if (fin != null)
				fin.close();
			if (out != null)
				out.close();
			if (file != null)
				file.delete(); // 删除临时文件
		}
	}

	/**
	 * 添加监督意见书
	 * 
	 * @Title: insertProposal
	 * @Description: TODO
	 * @author: kongjiang
	 * @param request
	 * @param record
	 * @return
	 */
	@RequestMapping("insertProposal")
	@ResponseBody
	public int insertProposal(HttpServletRequest request, Proposal record) {
		int num = supervisionAndCheckService.insertProposal(record);
		if (num > 0) {
			return record.getId();
		} else {
			return -1;
		}
	}

	/**
	 * 生成监督检查笔录pdf并返回url
	 * 
	 * @param id
	 * @return
	 * @throws DocumentException
	 * @throws IOException
	 */
	@RequestMapping("getProposalPdfUrl")
	@ResponseBody
	public String getProposalPdfUrl(int id,String type) throws IOException, DocumentException {
		Map<String, Object> map = supervisionAndCheckService.selectProposalPdfDataById(id);
		if (map == null || map.size() == 0) {
			return "";
		}
		String url = map.get("url")==null?"":map.get("url").toString();
		if (StringUtils.isNotBlank(url)&&"0".equals(type)) {
			return url;
		} else {
			Object checkDate = map.get("check_date");
			if (checkDate != null && StringUtils.isNotBlank(checkDate.toString())) {
				DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDate localDate = LocalDate.parse(checkDate.toString().substring(0, 10), dateTimeFormatter);
				map.put("year2", localDate.getYear());
				map.put("month2", localDate.getMonthValue());
				map.put("day2", localDate.getDayOfMonth());
			}
			url = WordUtil.getPdfAndUpload(map, "监督意见书.pdf");
			Proposal temp = new Proposal();
			temp.setId(Integer.valueOf(map.get("id").toString()));
			temp.setUrl(url);
			supervisionAndCheckService.updateProposal(temp);
			return url;
		}
	}

	/**
	 * 查看监督意见书
	 * 
	 * @Title: findProposal
	 * @Description: TODO
	 * @author: kongjiang
	 * @param id
	 * @return
	 */
	@RequestMapping("findProposal")
	@ResponseBody
	public Proposal findProposal(int id) {
		Proposal proposal = supervisionAndCheckService.findProposal(id);
		String proposalTime = proposal.getProposalTime();
		proposal.setYear(proposalTime.substring(0, 4));
		proposal.setMouth(proposalTime.substring(5, 7));
		proposal.setDay(proposalTime.substring(8, 10));
		proposal.setHour(proposalTime.substring(12, 14));
		proposal.setMinute(proposalTime.substring(15, 17));
		return proposal;
	}

	/**
	 * 删除监督意见书
	 * 
	 * @Title: deleteProposal
	 * @Description: TODO
	 * @author: kongjiang
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteProposal")
	@ResponseBody
	public int deleteProposal(int id) {
		return supervisionAndCheckService.deleteProposal(id);
	}

	/**
	 * 修改监督意见书
	 * 
	 * @Title: updateProposal
	 * @Description: TODO
	 * @author: kongjiang
	 * @param request
	 * @param record
	 * @return
	 */
	@RequestMapping("updateProposal")
	@ResponseBody
	public int updateProposal(HttpServletRequest request, Proposal record) {
		int num = supervisionAndCheckService.updateProposal(record);
		return num;
	}

	/**
	 * 打印监督意见书
	 * 
	 * @Title: printInspectionRecord
	 * @Description: TODO
	 * @author: kongjiang
	 * @param id
	 * @return
	 * @throws IOException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws ParseException
	 * @throws MalformedTemplateNameException
	 * @throws TemplateNotFoundException
	 */
	@RequestMapping("printProposal")
	public void printProposal(HttpServletRequest request, HttpServletResponse response, int id)
			throws TemplateNotFoundException, MalformedTemplateNameException, ParseException, IllegalArgumentException,
			IllegalAccessException, IOException {
		Proposal proposal = supervisionAndCheckService.findProposal(id);
		String proposalTime = proposal.getProposalTime();
		proposal.setYear(proposalTime.substring(0, 4));
		proposal.setMouth(proposalTime.substring(5, 7));
		proposal.setDay(proposalTime.substring(8, 10));
		proposal.setHour(proposalTime.substring(12, 14));
		proposal.setMinute(proposalTime.substring(15, 17));
		request.setAttribute("proposal", proposal);

		File file = null;
		InputStream fin = null;
		ServletOutputStream out = null;
		String fileName = new String("监督检查意见书.doc".getBytes("UTF-8"), "iso-8859-1");
		try {
			// 调用工具类WordGenerator的createDoc方法生成Word文档
			file = WordUtil.createDoc(ObjectConvertToMap.getMapFromObject(proposal), 1);
			fin = new FileInputStream(file);

			response.setCharacterEncoding("utf-8");
			response.setContentType("application/x-msdownload;");
			// 设置浏览器以下载的方式处理该文件默认名为resume.doc
			response.addHeader("Content-Disposition", "attachment;filename=" + fileName);

			out = response.getOutputStream();
			byte[] buffer = new byte[512]; // 缓冲区
			int bytesToRead = -1;
			// 通过循环将读入的Word文件的内容输出到浏览器中
			while ((bytesToRead = fin.read(buffer)) != -1) {
				out.write(buffer, 0, bytesToRead);
			}
		} finally {
			if (fin != null)
				fin.close();
			if (out != null)
				out.close();
			if (file != null)
				file.delete(); // 删除临时文件
		}
	}

	/**
	 * 添加责令整改通知书
	 * 
	 * @Title: insertNotice
	 * @Description: TODO
	 * @author: kongjiang
	 * @param request
	 * @param record
	 * @return
	 */
	@RequestMapping("insertNotice")
	@ResponseBody
	public int insertNotice(HttpServletRequest request, Notice record) {
		int num = supervisionAndCheckService.insertNotice(record);
		if (num > 0) {
			return record.getId();
		} else {
			return -1;
		}
	}

	/**
	 * 生成现场检查笔录pdf并返回url
	 * 
	 * @param id
	 * @return
	 * @throws DocumentException
	 * @throws IOException
	 */
	@RequestMapping("getNoticePdfUrl")
	@ResponseBody
	public String getNoticePdfUrl(int id,String type) throws IOException, DocumentException {
		Map<String, Object> map = supervisionAndCheckService.selectNoticePdfDataById(id);
		if (map == null || map.size() == 0) {
			return "";
		}
		String url = map.get("url")==null?"":map.get("url").toString();
		if (StringUtils.isNotBlank(url)&&"0".equals(type)) {
			return url;
		} else {
			String illegal_activities = map.get("illegal_activities") == null ? "" : map.get("illegal_activities").toString();
			int length2 = illegal_activities.length();
			if(length2>80){
				map.put("illegal_activities", illegal_activities.substring(0, length2/2));
				map.put("illegal_activities2", illegal_activities.substring(length2/2));
			}else if(length2>40){
				map.put("illegal_activities", illegal_activities.substring(0, 40));
				map.put("illegal_activities2", illegal_activities.substring(40));
			}
			String illegalContents = map.get("illegalContents") == null ? "" : map.get("illegalContents").toString();
			int length = illegalContents.length();
			if(length>90){
				map.put("illegalContents", illegalContents.substring(0, length/2));
				map.put("illegalContents2", illegalContents.substring(length/2));
			}else if(length>45){
				map.put("illegalContents", illegalContents.substring(0, 45));
				map.put("illegalContents2", illegalContents.substring(45));
			}
			String checkPersonName = map.get("checkPersonName") == null ? "" : map.get("checkPersonName").toString();
			String checkPersonCode = map.get("checkPersonCode") == null ? "" : map.get("checkPersonCode").toString();
			if (checkPersonName.split(",").length > 1) {
				map.put("checkPersonName", checkPersonName.replaceAll(",", "、"));
				map.put("checkPersonCode", checkPersonCode.replaceAll(",", "、"));
			} else if (checkPersonName.split(",").length == 1) {
				map.put("checkPersonName", checkPersonName.split(",")[0]);
				map.put("checkPersonCode", checkPersonCode.split(",")[0]);
			}
			Object checkDate = map.get("check_date");
			if (checkDate != null && StringUtils.isNotBlank(checkDate.toString())) {
				DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDate localDate = LocalDate.parse(checkDate.toString().substring(0, 10), dateTimeFormatter);
				map.put("year2", localDate.getYear());
				map.put("month2", localDate.getMonthValue());
				map.put("day2", localDate.getDayOfMonth());
			}
			Object noticeDate = map.get("notice_date");
			if (noticeDate != null && StringUtils.isNotBlank(noticeDate.toString())) {
				DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDate localDate = LocalDate.parse(noticeDate.toString().substring(0, 10), dateTimeFormatter);
				map.put("year", localDate.getYear());
				map.put("month", localDate.getMonthValue());
				map.put("day", localDate.getDayOfMonth());
			}
			url = WordUtil.getPdfAndUpload(map, "责令改正通知书.pdf");
			Notice temp = new Notice();
			temp.setId(Integer.valueOf(map.get("id").toString()));
			temp.setUrl(url);
			supervisionAndCheckService.updateNotice(temp);
			return url;
		}
	}

	/**
	 * 查看责令整改通知书
	 * 
	 * @Title: findProposal
	 * @Description: TODO
	 * @author: kongjiang
	 * @param id
	 * @return
	 */
	@RequestMapping("findNotice")
	@ResponseBody
	public Notice findNotice(int id) {
		Notice notice = supervisionAndCheckService.findNotice(id);
		String noticeDate = notice.getNoticeDate();
		notice.setYear(noticeDate.substring(0, 4));
		notice.setMouth(noticeDate.substring(5, 7));
		notice.setDay(noticeDate.substring(8, 10));
		return notice;
	}

	/**
	 * 删除责令整改通知书
	 * 
	 * @Title: deleteProposal
	 * @Description: TODO
	 * @author: kongjiang
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteNotice")
	@ResponseBody
	public int deleteNotice(int id) {
		return supervisionAndCheckService.deleteNotice(id);
	}

	/**
	 * 修改责令整改通知书
	 * 
	 * @Title: updateProposal
	 * @Description: TODO
	 * @author: kongjiang
	 * @param request
	 * @param record
	 * @return
	 */
	@RequestMapping("updateNotice")
	@ResponseBody
	public int updateNotice(HttpServletRequest request, Notice record) {
		int num = supervisionAndCheckService.updateNotice(record);
		return num;
	}

	/**
	 * 打印责令整改通知书
	 * 
	 * @Title: printInspectionRecord
	 * @Description: TODO
	 * @author: kongjiang
	 * @param id
	 * @return
	 * @throws IOException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws ParseException
	 * @throws MalformedTemplateNameException
	 * @throws TemplateNotFoundException
	 */
	@RequestMapping("printNotice")
	public void printNotice(HttpServletRequest request, HttpServletResponse response, int id)
			throws TemplateNotFoundException, MalformedTemplateNameException, ParseException, IllegalArgumentException,
			IllegalAccessException, IOException {
		Notice notice = supervisionAndCheckService.findNotice(id);
		String noticeDate = notice.getNoticeDate();
		notice.setYear(noticeDate.substring(0, 4));
		notice.setMouth(noticeDate.substring(5, 7));
		notice.setDay(noticeDate.substring(8, 10));
		request.setAttribute("notice", notice);

		File file = null;
		InputStream fin = null;
		ServletOutputStream out = null;
		String fileName = new String("责令整改通知书.doc".getBytes("UTF-8"), "iso-8859-1");
		try {
			// 调用工具类WordGenerator的createDoc方法生成Word文档
			file = WordUtil.createDoc(ObjectConvertToMap.getMapFromObject(notice), 2);
			fin = new FileInputStream(file);

			response.setCharacterEncoding("utf-8");
			response.setContentType("application/x-msdownload;");
			// 设置浏览器以下载的方式处理该文件默认名为resume.doc
			response.addHeader("Content-Disposition", "attachment;filename=" + fileName);

			out = response.getOutputStream();
			byte[] buffer = new byte[512]; // 缓冲区
			int bytesToRead = -1;
			// 通过循环将读入的Word文件的内容输出到浏览器中
			while ((bytesToRead = fin.read(buffer)) != -1) {
				out.write(buffer, 0, bytesToRead);
			}
		} finally {
			if (fin != null)
				fin.close();
			if (out != null)
				out.close();
			if (file != null)
				file.delete(); // 删除临时文件
		}
	}

	@RequestMapping("addTask")
	public String addTask() {
		return "supervisionAndCheck/addSupervisionAndTask";
	}

	/**
	 * 新增监督检查任务
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveTask")
	@ResponseBody
	public JSONObject saveTask(HttpServletRequest request, SupervisionAndCheckTask supervisionAndCheckTask) {
		try {
			String enterpriseids = supervisionAndCheckTask.getEnterpriseids();
			if (StringUtils.isBlank(enterpriseids)) {
				return ResultUtil.appJsonObject(false, "选择的企业不能为空");
			}
			if (StringUtils.isBlank(supervisionAndCheckTask.getUnitcode())) {
				return ResultUtil.jsonObject("false", "委托单位不能为空");
			}

			if (StringUtils.isBlank(supervisionAndCheckTask.getStarttimeStr())) {
				return ResultUtil.jsonObject("false", "检查开始日期不能为空");
			}
			if (StringUtils.isBlank(supervisionAndCheckTask.getEndtimeStr())) {
				return ResultUtil.jsonObject("false", "检查结束日期不能为空");
			}
			if (StringUtils.isBlank(supervisionAndCheckTask.getCheckFrequencyCode())) {
				return ResultUtil.jsonObject("false", "检查频次不能为空");
			}

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			supervisionAndCheckTask.setStarttime(dateFormat.parse(supervisionAndCheckTask.getStarttimeStr()));
			supervisionAndCheckTask.setEndtime(dateFormat.parse(supervisionAndCheckTask.getEndtimeStr()));

			Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");
			supervisionAndCheckTask.setCreatePersonUser(admin.getUsername());
			supervisionAndCheckTask.setCreateUnitCode(admin.getUnitCode());

			// 根据选择企业生成多个监督检查任务
			String[] ids = supervisionAndCheckTask.getEnterpriseids().split(",");
			String[] names = supervisionAndCheckTask.getEnterpriseNames().split(",");
			try {
				for (int i = 0; i < ids.length; i++) {
					supervisionAndCheckTask.setEnterpriseids(ids[i]);
					supervisionAndCheckTask.setEnterpriseNames(names[i]);
					supervisionAndCheckService.insert(supervisionAndCheckTask);
				}
				return ResultUtil.jsonObject("true", "添加成功");
			} catch (Exception e) {
				return ResultUtil.jsonObject("false", "添加失败");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return ResultUtil.jsonObject("false", "添加失败");
		}

	}

	@RequestMapping("selectSupervisionCheckTask")
	@ResponseBody
	public List<SupervisionAndCheckTask> selectSupervisionCheckTask(HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("checkFrequencyCode", request.getParameter("checkFrequencyCode"));
		param.put("enterpriseType", request.getParameter("enterpriseType"));
		param.put("startCheckDate", request.getParameter("startCheckDate"));
		param.put("endCheckDate", request.getParameter("endCheckDate"));
		param.put("checkUnitCode", request.getParameter("checkUnitCode"));
		param.put("enterpriseNames", request.getParameter("enterpriseNames"));
		if (admin == null) {
			param.put("currentUnitCode", request.getParameter("currentUnitCode"));
		} else {
			if (!Constant.ADMIN.equals(admin.getUsername())) {
				param.put("currentUnitCode", request.getParameter("currentUnitCode"));
			}
		}
		param.put("startNum", request.getParameter("startNum"));
		param.put("limit", request.getParameter("limit"));
		return supervisionAndCheckService.selectSupervisionCheckTask(param);
	}

	@RequestMapping("selectSupervisionCheckTaskTotal")
	@ResponseBody
	public int selectSupervisionCheckTaskTotal(HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("checkFrequencyCode", request.getParameter("checkFrequencyCode"));
		param.put("enterpriseType", request.getParameter("enterpriseType"));
		param.put("startCheckDate", request.getParameter("startCheckDate"));
		param.put("endCheckDate", request.getParameter("endCheckDate"));
		param.put("checkUnitCode", request.getParameter("checkUnitCode"));
		param.put("enterpriseNames", request.getParameter("enterpriseNames"));
		if (admin == null) {
			param.put("currentUnitCode", request.getParameter("currentUnitCode"));
		} else {
			if (!Constant.ADMIN.equals(admin.getUsername())) {
				param.put("currentUnitCode", request.getParameter("currentUnitCode"));
			}
		}
		return supervisionAndCheckService.selectSupervisionCheckTaskTotal(param);
	}

	@RequestMapping("selectSupervisionCheckTaskById")
	@ResponseBody
	public SupervisionAndCheckTask selectSupervisionCheckTaskById(Integer id) {
		return supervisionAndCheckService.selectSupervisionCheckTaskById(id);
	}

	@RequestMapping("delSupervisionAndCheckTaskById")
	@ResponseBody
	public int delSupervisionAndCheckTaskById(Integer id) {
		return supervisionAndCheckService.delSupervisionAndCheckTaskById(id);
	}

	/**
	 * 图片上传
	 * 
	 * @Description: TODO
	 * @author kongjiang
	 * @date 2017年3月20日 上午9:55:10
	 * @param request
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	@RequestMapping("upload")
	@ResponseBody
	public String upload(HttpServletRequest request, @RequestParam("fileselect") MultipartFile[] fileselect)
			throws FileNotFoundException, IOException {

		String url = "";
		String urls = "";
		for (int i = 0, j = fileselect.length; i < j; i++) {
			if (fileselect[i] != null) {
				url = new Date().getTime() + fileselect[i].getOriginalFilename();
				OSSClient ossClient = OSS.getOssClient();
				ossClient.putObject(OSS.bucketName, url, fileselect[i].getInputStream());
				ossClient.shutdown();
			}
			urls += url + ",";
		}
		return StringUtils.isBlank(urls) ? "" : urls.substring(0, urls.length() - 1);
	}

}
