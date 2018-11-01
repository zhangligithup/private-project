package cn.tslanpu.test.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tslanpu.test.admin.service.AdminService;

//初始化密码
public class UserInitializeServlet extends HttpServlet {
	private AdminService adminService = new AdminService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
		
		//删除信息
		String str = request.getParameter("id");
		int id;
		if(str != null && !str.trim().isEmpty()){
			try{
				id = Integer.parseInt(str);
				adminService.initialize(id);
			}catch(RuntimeException e){}
		}
		response.getWriter().print("密码初始化成功");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
