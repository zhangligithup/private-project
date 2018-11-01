package cn.tslanpu.test.admin.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.admin.service.AdminService;
import cn.tslanpu.test.pager.PageBean;

public class UserFindServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
		/*
		 * 1.获取pageCode参数，如果不存在，等于1，如果存在，赋值即可
		 * 2.通过pageCode来调用service的fingByCategory得到pageBean
		 * 3.把pageBean保存到request中
		 * 4.转发到PersonnelFind.jsp中
		 */
		int pageCode = getPageCode(request);
		
		String url = getUrl(request);
		PageBean<Admin> pb = adminService.queryAll(pageCode);
		pb.setUrl(url);
		//request.getSession().setAttribute("pb", pb);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pb",pb);
		JSON json = JSONObject.fromObject(map);
		response.getWriter().print(json);
		
		//request.getRequestDispatcher("/pages/regulator/personnelFind.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
	//获取pageCode
	private int getPageCode(HttpServletRequest req){
		int pageCode = 1;
		String param = req.getParameter("pageCode");
		if(param != null && !param.trim().isEmpty()){
			try{
				pageCode = Integer.parseInt(param);
			}catch(RuntimeException e){}
		}
		return pageCode;
	}
	//获取url
	private String getUrl(HttpServletRequest req){
		String url = req.getRequestURL() + "?"; //+ req.getQueryString();
		int index = url.lastIndexOf("pageCode=");
		if(index != -1){
			url = url.substring(0, index);
		}
		return url;
	}

}
