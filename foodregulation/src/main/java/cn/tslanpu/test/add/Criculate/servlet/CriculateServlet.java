package cn.tslanpu.test.add.Criculate.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import cn.itcast.commons.CommonUtils;
import cn.tslanpu.test.add.Criculate.domain.Criculate;
import cn.tslanpu.test.add.Criculate.domain.Criculate_jdjc;
import cn.tslanpu.test.add.Criculate.service.CriculateService;
import cn.tslanpu.test.utils.BaseServlet;


public class CriculateServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private CriculateService criculateService = new CriculateService();
	
	
	//作用于通过关键字来获取被检查单位名称
	public void dispNameData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			list=criculateService.dispNameData();
			request.setAttribute("qy", list);
			request.getRequestDispatcher("/pages/inspect/foodsale.jsp").forward(request, response);
	}
	//获取查询监督检查数据     http://localhost:8080/tslanpu/ProductionServlet?method=getjdjcData&id=119
	public void getjdjcData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Criculate_jdjc criculate_jdjc;
		criculate_jdjc=criculateService.getjdjcData( Integer.parseInt(request.getParameter("id")));
		request.setAttribute("iddata", criculate_jdjc);
		request.getRequestDispatcher("/pages/inspect/foodsale.jsp").forward(request, response);
		}
	public void add_jdjc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	 		Map map = request.getParameterMap();
	 		Criculate_jdjc criculate_jdjc = CommonUtils.toBean(map, Criculate_jdjc.class);
	 		criculateService.add_jdjc(criculate_jdjc);
			request.setAttribute("success", "提交成功");
			request.getRequestDispatcher("/CriculateServlet?method=dispNameData").forward(request, response);
	}
	
	public void ajaxFull(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			response.setContentType("text/html;charset=utf-8");
			((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
			Criculate byqynameCri = criculateService.byqynameFull(request.getParameter("qyname"));
			Map<String, Object> map = new HashMap<String, Object>();
					map.put("byqynameData", byqynameCri);
					JSON jsonData = JSONObject.fromObject(map);
					response.getWriter().print(jsonData);
	}
}
