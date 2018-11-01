package cn.tslanpu.test.unit.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodregulation.dao.entity.Dictionary;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import cn.tslanpu.test.unit.Service.UnitService;

public class UnitServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
			UnitService unit = new UnitService();
			List<Dictionary> list = unit.query();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			JSON json = JSONObject.fromObject(map);
			response.getWriter().print(json);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
