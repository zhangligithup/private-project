package cn.tslanpu.test.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tslanpu.test.admin.service.AdminService;

public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
			request.setCharacterEncoding("utf-8");
			//删除信息
			String str = request.getParameter("id");
			int id;
			if(str != null && !str.trim().isEmpty()){
				try{
					id = Integer.parseInt(str);
					adminService.delete(id);
				}catch(RuntimeException e){}
			}
			
			response.getWriter().print(1);
			
			//删除后回到当前页面
			/*
			 * 1.获取pageCode参数，如果不存在，等于1，如果存在，赋值即可
			 * 2.通过pageCode来调用service的fingByCategory得到pageBean
			 * 3.把pageBean保存到request中
			 * 4.转发到PersonnelFind.jsp中
			 
			int pageCode = getPageCode(request);
			
			String url = getUrl(request);
			PageBean<Admin> pb = adminService.queryAll(pageCode);
			pb.setUrl(url);
			request.getSession().setAttribute("pb", pb);
			*/
			//request.getRequestDispatcher("/pages/regulator/personnelFind.jsp").forward(request, response);
			
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
