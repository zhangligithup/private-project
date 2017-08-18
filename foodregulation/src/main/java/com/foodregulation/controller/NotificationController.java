package com.foodregulation.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.GetObjectRequest;
import com.aliyun.oss.model.OSSObject;
import com.foodregulation.dao.entity.Notification;
import com.foodregulation.service.notification.NotificationService;
import com.foodregulation.util.DateUtil;
import com.foodregulation.util.StringUtils;

import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.utils.OSS;

@Controller
@RequestMapping("notification")
public class NotificationController {

	@Autowired
	NotificationService notificationService;

	@RequestMapping("show")
	public String show() {
		return "notificationQuery";
	}

	@RequestMapping("save")
	@ResponseBody
	public int save(HttpServletRequest request, Notification notification){
		//MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request,
		//		MultipartHttpServletRequest.class);
		//MultipartFile file = multipartRequest.getFile("file");

//		if (file != null&&file.getSize()>0) {
//			String url = new Date().getTime() + file.getOriginalFilename();
//			OSSClient ossClient = OSS.getOssClient();
//			ossClient.putObject(OSS.bucketName, url, file.getInputStream());
//			ossClient.shutdown();
//			notification.setUrl(url);
//		}

		notification.setTime(DateUtil.getDateToStr(new Date()));
		return notificationService.insert(notification);
	}

	@RequestMapping("query")
	@ResponseBody
	public List<Notification> query(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String title = request.getParameter("title");
		map.put("title", title);
		map.put("personId", request.getParameter("personId"));
		map.put("toCode", ((Admin) request.getSession().getAttribute("sessionAdmin")).getUnitCode());
		map.put("startNum", request.getParameter("startNum"));
		map.put("limit", request.getParameter("limit"));
		return notificationService.selectByParam(map);
	}

	@RequestMapping("selectNotificationTotal")
	@ResponseBody
	public int selectNotificationTotal(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("personId", request.getParameter("personId"));
		String title = request.getParameter("title");
		map.put("title", title);
		map.put("toCode", ((Admin) request.getSession().getAttribute("sessionAdmin")).getUnitCode());
		return notificationService.selectNotificationTotal(map);
	}

	@RequestMapping("findNotification")
	@ResponseBody
	public Notification findNotification(HttpServletRequest request, int id) {
		return notificationService.findNotification(id);
	}

	@RequestMapping("deleteNotification")
	@ResponseBody
	public int deleteNotification(HttpServletRequest request, int id) {
		return notificationService.deleteNotification(id);
	}

	@RequestMapping("download")
	@ResponseBody
	public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 图片URL
		String url = request.getParameter("url");

		OSSClient ossClient = OSS.getOssClient();
		OSSObject ossObject = ossClient.getObject(new GetObjectRequest(OSS.bucketName, url));

		// 读取数据
		InputStream inputStream = ossObject.getObjectContent();
		OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
		response.setContentType("application/x-msdownload;");
		response.setHeader("Content-Disposition", "attachment;filename=" + url);
		byte[] b = new byte[2048];
		int length;
		while ((length = inputStream.read(b)) > 0) {
			toClient.write(b, 0, length);
		}
		toClient.flush();
		toClient.close();
		inputStream.close();
		// 关闭client
		ossClient.shutdown();
	}

}
