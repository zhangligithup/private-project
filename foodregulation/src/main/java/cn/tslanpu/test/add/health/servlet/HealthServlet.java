package cn.tslanpu.test.add.health.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import cn.tslanpu.test.add.health.domain.Health;
import cn.tslanpu.test.add.health.domain.Health_jdjc;
import cn.tslanpu.test.add.health.service.HealthService;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.utils.BaseServlet;

public class HealthServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	private HealthService healthService = new HealthService();

	// 增加信息
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			Health health = setBean(request, response);
			healthService.add(health);
			out.println(1);
		} catch (Exception e) {
			out.println(0);
		}
	}

	// 查看详细信息
	public void infor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 根据id查询所属分局
		String str = request.getParameter("enterpriseId");
		int id = Integer.parseInt(str);
		Health health = healthService.healthFind(id);

		// 保存当前页码
		String pageCode = request.getParameter("pageCode");
		request.setAttribute("pageCode", pageCode);

		// 保存当前所属部门
		String name = request.getParameter("item");
		request.setAttribute("item", name);

		request.setAttribute("health", health);
		request.getRequestDispatcher("/pages/tables/health/healthInformation.jsp").forward(request, response);
	}

	// 更新信息
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			// 判断返回的状态
			request.setAttribute("status", 2);

			/*
			 * 获取当前Id根据id查询及修改
			 */
			String str = request.getParameter("idH");
			int id = Integer.parseInt(str);

			Health health = setBean(request, response);

			// 更新
			healthService.healthUpdate(id, health);

			// 回显
			Health health1 = healthService.healthFind(id);

			request.setAttribute("health", health1);
			out.println(1);
		} catch (Exception e) {
			out.println(0);
		}
	}

	// 打印
	public void print(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 根据id查询所属分局
		String str = request.getParameter("id");
		int id = Integer.parseInt(str);
		Health health = healthService.healthFind(id);
		String[] arrManage = health.getManage().split(",");
		String[] arrJyType = health.getJyType().split(",");
		request.setAttribute("arrJyType", arrJyType);
		request.setAttribute("arrManage", arrManage);
		request.setAttribute("health", health);
		request.getRequestDispatcher("/pages/tables/health/downloadHealthInfo.jsp").forward(request, response);
	}

	// 删除信息
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 删除信息
		String str = request.getParameter("id");
		int id;
		if (str != null && !str.trim().isEmpty()) {
			try {
				id = Integer.parseInt(str);
				healthService.delete(id);
			} catch (RuntimeException e) {
				response.getWriter().print(0);
			}
		}
		response.getWriter().print(1);
	}

	// 作用于通过关键字来获取被检查单位名称
	public void dispNameData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		list = healthService.dispNameData();
		request.setAttribute("qy", list);
		request.getRequestDispatcher("/pages/inspect/healthregular.jsp").forward(request, response);
	}

	// 获取查询监督检查数据
	// http://localhost:8080/tslanpu/ProductionServlet?method=getjdjcData&id=119
	public void getjdjcData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Health_jdjc health_jdjc;
		health_jdjc = healthService.getjdjcData(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("iddata", health_jdjc);
		request.getRequestDispatcher("/pages/inspect/healthregular.jsp").forward(request, response);
	}

	// ajax补全
	public void ajaxFull(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse) response).addHeader("Access-Control-Allow-Origin", "*");
		Health byqynameData = healthService.byqynameFull(request.getParameter("qyname"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("byqynameData", byqynameData);
		JSON jsonData = JSONObject.fromObject(map);
		response.getWriter().print(jsonData);
	}

	@SuppressWarnings("unchecked")
	private Health setBean(HttpServletRequest request, HttpServletResponse response) {

		Map map = request.getParameterMap();
		Health health = CommonUtils.toBean(map, Health.class);

		String jyType = "";
		String[] jyTypeArr = request.getParameterValues("jyType");
		if (jyTypeArr != null) {
			for (int i = 0; i < jyTypeArr.length; i++) {
				jyType += jyTypeArr[i];
				if (i != jyTypeArr.length - 1) {
					jyType += ",";
				}
			}
		}
		health.setJyType(jyType);

		String manage = "";
		String[] manageArr = request.getParameterValues("manage");
		if (manageArr != null) {
			for (int i = 0; i < manageArr.length; i++) {
				manage += manageArr[i];
				if (i != manageArr.length - 1) {
					manage += ",";
				}
			}
		}
		health.setManage(manage);

		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");// 得到当前修改用户
		health.setAmend(admin.getName());

		return health;
	}
}
