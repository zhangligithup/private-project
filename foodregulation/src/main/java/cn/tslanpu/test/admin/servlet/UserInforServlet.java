package cn.tslanpu.test.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tslanpu.test.action.action.Action;
import cn.tslanpu.test.action.service.ActionService;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.admin.service.AdminService;
import cn.tslanpu.test.unit.Service.PositionService;
import cn.tslanpu.test.unit.Service.UnitService;
import cn.tslanpu.test.unit.domain.Position;

public class UserInforServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();
	private ActionService actionService = new ActionService();
	private UnitService unitService = new UnitService();
	private PositionService positionService = new PositionService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
			
			
//			/*
//			 * 1.查询所有单位
//			 * 2.保存到session域
//			 */
//			List<Unit> list = unitService.query();
//			request.setAttribute("list", list);
			
			/*
			 * 1.查询所有职务
			 * 2.保存到session域
			 */
			List<Position> listPos = positionService.query();
			request.setAttribute("listPos1", listPos);
		
			//得到权限bean
			List<Action> actionList = actionService.queryAll();
			request.getSession().setAttribute("actionList", actionList);
			
			//当前人员Id,根据Id查询
			String str = request.getParameter("id");
			int id = Integer.parseInt(str);
			
			Admin admin = adminService.queryInfor(id);
			request.setAttribute("user", admin);
			request.getRequestDispatcher("/pages/regulator/personnelInfor.jsp").forward(request, response);
			
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
