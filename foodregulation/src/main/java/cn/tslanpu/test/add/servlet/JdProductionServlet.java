package cn.tslanpu.test.add.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.tslanpu.test.add.bean.JdProduction;
import cn.tslanpu.test.add.service.JdProductionService;

public class JdProductionServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		Map map = request.getParameterMap();
		
		JdProduction jd = CommonUtils.toBean(map, JdProduction.class);
		JdProductionService jdService = new JdProductionService();
		
		int num = jdService.queryExits(jd.getName());
		if(num > 0){
			out.print("请不要重复提交");
		}else{
			jdService.add(jd);
			out.print("提交成功");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doGet(request, response);
	}

}
