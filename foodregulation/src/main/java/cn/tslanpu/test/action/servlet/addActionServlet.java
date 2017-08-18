package cn.tslanpu.test.action.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tslanpu.test.action.action.Action;
import cn.tslanpu.test.action.service.ActionService;

public class addActionServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ActionService actionService = new ActionService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");

			String actionname= request.getParameter("actionname");
			
			Action action = actionService.queryActionname(actionname);
			
			if(!actionname.trim().isEmpty() && action != null && actionname.equals(action.getActionname())){
				response.getWriter().print(-1);
				return;
			}
			
			int num = actionService.count();
			System.out.println(num);
			int number = actionService.add(actionname, num + 1);
			if(number > 0){
				response.getWriter().print(1);
			}else{
				response.getWriter().print(0);
			}
			
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
