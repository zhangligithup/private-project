package cn.tslanpu.test.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.admin.service.AdminService;

public class UpdatePassword extends HttpServlet {

	private AdminService adminService = new AdminService();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
		
		String password = request.getParameter("password");
		
		//得到当前登陆用户
		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");
		String username = admin.getUsername();
		
		adminService.updatePassword(username, password);
		
		response.getWriter().print(1);
	}
}
