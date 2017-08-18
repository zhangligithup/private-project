package cn.tslanpu.test.add.industry.servlet;

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
import cn.tslanpu.test.add.industry.domain.Industry;
import cn.tslanpu.test.add.industry.domain.Industry_jdjc;
import cn.tslanpu.test.add.industry.service.IndustryService;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.utils.BaseServlet;

public class IndustryServlet extends BaseServlet {

	private IndustryService industryService = new IndustryService();

	// 增加信息
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			Industry industry = setBean(request, response);
			industryService.add(industry);
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
		Industry industry = industryService.industryFind(id);

		// 保存当前页码
		String pageCode = request.getParameter("pageCode");
		request.setAttribute("pageCode", pageCode);

		// 保存当前所属部门
		String name = request.getParameter("item");
		request.setAttribute("item", name);

		request.setAttribute("industry", industry);
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
			String str = request.getParameter("idI");
			int id = Integer.parseInt(str);

			Industry industry = setBean(request, response);

			// 更新
			industryService.industryUpdate(id, industry);

			// 回显
			Industry industry1 = industryService.industryFind(id);

			request.setAttribute("industry", industry1);
			request.getRequestDispatcher("/pages/tables/industry/industryInformation.jsp").forward(request, response);
			out.println(1);
		} catch (Exception e) {
			out.println(0);
		}
	}

	// 打印
	public void print(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 根据id查询所属分局
		String str = request.getParameter("idI");
		int id = Integer.parseInt(str);
		System.out.println(id);
		Industry industry = industryService.industryFind(id);
		String[] arr = industry.getEveryOne().split(",");
		request.setAttribute("everyone", arr);
		request.setAttribute("industry", industry);
		request.getRequestDispatcher("/pages/tables/industry/downloadIndustryInformation.jsp").forward(request,
				response);
	}

	// 删除信息
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 删除信息
		String str = request.getParameter("id");
		int id;
		if (str != null && !str.trim().isEmpty()) {
			try {
				id = Integer.parseInt(str);
				industryService.delete(id);
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
		list = industryService.dispNameData();
		request.setAttribute("qy", list);
		request.getRequestDispatcher("/pages/inspect/industryregular.jsp").forward(request, response);
	}

	public void add_jdjc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map map = request.getParameterMap();
		Industry_jdjc industry_jdjc = CommonUtils.toBean(map, Industry_jdjc.class);
		industryService.add_jdjc(industry_jdjc);
		request.setAttribute("success", "提交成功");
		request.getRequestDispatcher("/CriculateServlet?method=dispNameData").forward(request, response);
	}

	// 获取查询监督检查数据
	// http://localhost:8080/tslanpu/ProductionServlet?method=getjdjcData&id=119
	public void getjdjcData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Industry_jdjc industry_jdjc;
		industry_jdjc = industryService.getjdjcData(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("iddata", industry_jdjc);
		request.getRequestDispatcher("/pages/inspect/industryregular.jsp").forward(request, response);
	}

	public void ajaxFull(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse) response).addHeader("Access-Control-Allow-Origin", "*");
		Industry byqynameInd = industryService.byqynameFull(request.getParameter("qyname"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("byqynameData", byqynameInd);
		JSON jsonData = JSONObject.fromObject(map);
		response.getWriter().print(jsonData);
	}

	@SuppressWarnings("unchecked")
	private Industry setBean(HttpServletRequest request, HttpServletResponse response) {

		Map map = request.getParameterMap();
		Industry industry = CommonUtils.toBean(map, Industry.class);

		String everyOne = "";
		String[] everyOneArr = request.getParameterValues("everyOne");
		if (everyOneArr != null) {
			for (int i = 0; i < everyOneArr.length; i++) {
				everyOne += everyOneArr[i];
				if (i != everyOneArr.length - 1) {
					everyOne += ",";
				}
			}
		}
		industry.setEveryOne(everyOne);

		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");// 得到当前修改用户
		industry.setAmend(admin.getName());

		return industry;
	}
}
