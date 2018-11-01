package com.foodregulation.controller.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tslanpu.test.add.agricultural.domain.Agricultural;
import cn.tslanpu.test.add.agricultural.service.AgriculturalService;

/**
 * 小摊点
 * @author ZhangLi
 *
 */
@Controller
@RequestMapping("xiaotandian")
public class XiaoTanDianController {
	private AgriculturalService agriculturalService = new AgriculturalService();
	
	@RequestMapping("index")
	public String index(HttpServletRequest request,int agriculturalId) {
		request.getSession().setAttribute("agriculturalId", agriculturalId);
		Agricultural agricultural = agriculturalService.agriculturalFind(agriculturalId);
		request.setAttribute("agricultural", agricultural);
		return "xiaotandian/index";
	}
	@RequestMapping("flex")
	public String flex(HttpServletRequest request) {
		String businessLicense = request.getParameter("businessLicense");
		String smallStallregistrationCard = request.getParameter("smallStallregistrationCard");
		String healthCertificate = request.getParameter("healthCertificate");
		request.setAttribute("businessLicense", businessLicense == null?"":businessLicense);
		request.setAttribute("smallStallregistrationCard", smallStallregistrationCard == null?"":smallStallregistrationCard);
		request.setAttribute("healthCertificate", healthCertificate == null?"":healthCertificate);
		return "xiaotandian/flex";
	}
	@RequestMapping("list")
	public String list(HttpServletRequest request) {
		String qyname = request.getParameter("qyname");
		request.setAttribute("qyname", qyname == null?"":qyname);
		return "xiaotandian/list";
	}
	@RequestMapping("checkList")
	public String checkList(HttpServletRequest request) {
		String qyname = request.getParameter("qyname");
		request.setAttribute("qyname", qyname == null?"":qyname);
		return "xiaotandian/checkList";
	}
}
