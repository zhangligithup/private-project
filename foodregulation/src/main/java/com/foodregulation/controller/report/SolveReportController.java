package com.foodregulation.controller.report;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSException;
import com.foodregulation.dao.entity.SolveReport;
import com.foodregulation.service.report.SolveReportService;

import cn.tslanpu.test.utils.OSS;
/**
 * 投诉举报处理
 */
@Controller
@RequestMapping("/solveReport")
public class SolveReportController {
	
	@Autowired
	SolveReportService solveReportService;
	
	/**
	 * 投诉举报添加处理
	 * @throws IOException 
	 * @throws ClientException 
	 * @throws OSSException 
	 */
	@RequestMapping("/handleReport")
	@ResponseBody
	public int handleReport(HttpServletRequest request,SolveReport solveReport) throws OSSException, ClientException, IOException{
		MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request,
				MultipartHttpServletRequest.class);
		MultipartFile file = multipartRequest.getFile("file");

		if (file != null&&file.getSize()>0) {
			String url = new Date().getTime() + file.getOriginalFilename();
			OSSClient ossClient = OSS.getOssClient();
			ossClient.putObject(OSS.bucketName, url, file.getInputStream());
			ossClient.shutdown();
			solveReport.setImgUrl(url);;
		}
		
		int num = solveReportService.handleReport(solveReport);
		return num;
	}
	
	@RequestMapping("/findHandleReport")
	@ResponseBody
	public SolveReport findHandleReport(HttpServletRequest request,String reportId){
		SolveReport solveReport = solveReportService.findHandleReport(reportId);
		return solveReport;
	}

}
