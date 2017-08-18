package cn.tslanpu.test.index.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.complain.domain.Complain;
import cn.tslanpu.test.index.service.IndexService;

public class IndexServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
		
		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");
		
		//防盗链
		 if(null == admin){
	        response.sendRedirect(request.getContextPath()+"/login.jsp");  
	          return; 
	     }
		
		String department = admin.getDepartment();
		
		IndexService indexService = new IndexService();
		//List<Complain> listComplian = indexService.queryUntreated(department);
		
		request.setAttribute("again", "again");
		
		Map<String, Integer> mapNum = indexService.getNumber();
		request.setAttribute("mapNum", mapNum);
		request.setAttribute("listComplain", null);
		
		//NotificationService notificationService = new NotificationService();
		///List<Notification> listT = notificationService.find();
		request.setAttribute("notificationListT", null);
		
		request.getRequestDispatcher("/pages/index.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
