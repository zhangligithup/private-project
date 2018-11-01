package cn.tslanpu.test.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tslanpu.test.unit.Service.PositionService;
import cn.tslanpu.test.unit.Service.UnitService;
import cn.tslanpu.test.unit.domain.Position;
import cn.tslanpu.test.utils.TokenProccessor;


public class FormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UnitService unitService = new UnitService();
	private PositionService positionService = new PositionService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
		
		/*
		 * 1.查询所有职务
		 * 2.保存到session域
		 */
		List<Position> listPos = positionService.query();
		request.getSession().setAttribute("listPos", listPos);
		
		String token = TokenProccessor.getInstance().makeToken();//创建令牌
		request.getSession().setAttribute("tokenU", token);
		response.sendRedirect(request.getContextPath()+"/pages/regulator/personnel.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
