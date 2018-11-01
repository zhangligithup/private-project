package cn.tslanpu.test.add.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import cn.tslanpu.test.add.Criculate.domain.Criculate;
import cn.tslanpu.test.add.Criculate.service.CriculateService;
import cn.tslanpu.test.pager.PageBean;

public class CriculateFindServlet extends HttpServlet {
	private CriculateService criculateService = new CriculateService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");

		/*
		 * 1.获取pageCode参数，如果不存在，等于1，如果存在，赋值即可
		 * 2.通过pageCode来调用service的queryByPage得到pageBean
		 * 3.把pageBean保存到request中
		 * 4.转发到criculateFind1.jsp中
		 */
		
		int pageCode = 1;
		String str = request.getParameter("pageCode");
		if(str != null && !str.trim().isEmpty()){
			pageCode = Integer.parseInt(str);
		}
		PageBean<Criculate> pb = criculateService.fingByCategory(pageCode);
		request.setAttribute("pb", pb);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pb", pb);
		JSON jsonData = JSONObject.fromObject(map);
		response.getWriter().print(jsonData);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
