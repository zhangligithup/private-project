package cn.tslanpu.test.action.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import cn.tslanpu.test.action.action.Action;
import cn.tslanpu.test.action.service.ActionService;

public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = -5283765177263245688L;
	
	private ActionService actionServlet = new ActionService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");

		List<Action> list = actionServlet.queryAll();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		JSONObject jsonData = JSONObject.fromObject(map);
		response.getWriter().print(jsonData);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
