package cn.tslanpu.test.add.agricultural.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import cn.tslanpu.test.add.agricultural.domain.Agricultural;
import cn.tslanpu.test.add.agricultural.service.AgriculturalService;


public class QrCode extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
		
		String idStr = request.getParameter("id");
		//System.out.println(id);
		
		int id = Integer.valueOf(idStr);
		
		AgriculturalService service = new AgriculturalService();
		
		Agricultural agricultural = service.agriculturalFind(id);
		
		JSONObject json = new JSONObject();
		
		json.put("common", agricultural);
		
		response.getWriter().print(json);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
