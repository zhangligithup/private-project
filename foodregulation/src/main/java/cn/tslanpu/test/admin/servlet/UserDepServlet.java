package cn.tslanpu.test.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.admin.service.AdminService;
import cn.tslanpu.test.pager.PageBean;

public class UserDepServlet extends HttpServlet {
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
		//获取部门
		String strItem = request.getParameter("item");
		String department = new String(strItem.getBytes("ISO-8859-1"),"UTF-8");
		//当前页
		int pageCdoe = getPageCode(request);
		//保存当天部分
		request.setAttribute("item", department);
		//
		String url = getUrl(request);
		//url += "item=" + department;
		
		PageBean<Admin> pb = adminService.queryDep(department, pageCdoe);
		pb.setUrl(url);
		request.getSession().setAttribute("pb", pb);
		
		request.getRequestDispatcher("/pages/regulator/personnelFind.jsp").forward(request, response);
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
		String url = req.getRequestURL() + "?" + req.getQueryString();
		int index = url.lastIndexOf("&pageCode=");
		if(index != -1){
			url = url.substring(0, index);
		}
		return url;
	}

}
