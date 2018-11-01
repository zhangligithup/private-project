package cn.tslanpu.test.add.food.servlet;

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
import cn.tslanpu.test.add.food.domain.Food;
import cn.tslanpu.test.add.food.domain.Food_jdjc;
import cn.tslanpu.test.add.food.service.FoodService;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.utils.BaseServlet;

public class FoodServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	private FoodService foodService = new FoodService();

	// 增加信息
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			Food food = setBean(request, response);
			foodService.add(food);
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
		Food food = foodService.foodFind(id);

		// 保存当前页码
		String pageCode = request.getParameter("pageCode");
		request.setAttribute("pageCode", pageCode);

		// 保存当前所属部门
		String name = request.getParameter("item");
		request.setAttribute("item", name);

		request.setAttribute("food", food);
		request.getRequestDispatcher("/pages/tables/food/foodInformation.jsp").forward(request, response);
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
			String str = request.getParameter("id");
			int id = Integer.parseInt(str);
			Food food = setBean(request, response);

			// 重新设置department
			// criculate1.setDepartment(departmentId);
			// 更新
			foodService.foodUpdate(id, food);
			// 回显
			Food food1 = foodService.foodFind(id);
			request.setAttribute("food", food1);
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
		Food food = foodService.foodFind(id);
		String[] arrType = food.getType().split(",");
		String[] arrRemark = food.getRemark().split(",");
		request.setAttribute("arrType", arrType);
		request.setAttribute("food", food);
		request.setAttribute("arrRemark", arrRemark);
		request.getRequestDispatcher("/pages/tables/food/downloadFoodInfo.jsp").forward(request, response);
	}

	// 删除信息
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 删除信息
		String str = request.getParameter("id");
		int id;
		if (str != null && !str.trim().isEmpty()) {
			try {
				id = Integer.parseInt(str);
				foodService.delete(id);
				System.out.println(id);
			} catch (RuntimeException e) {
				response.getWriter().print(0);
			}
		}
		response.getWriter().print(1);
	}

	// 得到FoodBean
	@SuppressWarnings("unchecked")
	private Food setBean(HttpServletRequest request, HttpServletResponse response) {

		Map map = request.getParameterMap();
		Food food = CommonUtils.toBean(map, Food.class);

		String[] typeArray = request.getParameterValues("type");
		String type = "";
		if (typeArray != null) {
			for (int i = 0; i < typeArray.length; i++) {
				type += typeArray[i];
				if (i != typeArray.length - 1) {
					type += ",";
				}
			}
		}
		food.setType(type);

		String[] remarkArray = request.getParameterValues("remark");
		String remark = "";
		if (remarkArray != null) {
			for (int i = 0; i < remarkArray.length; i++) {
				remark += remarkArray[i];
				if (i != remarkArray.length - 1) {
					remark += ",";
				}
			}
		}
		food.setRemark(remark);

		// 保存当前修改人
		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");
		food.setAmend(admin.getName());

		return food;
	}

	// 作用于通过关键字来获取被检查单位名称
	public void dispNameData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		list = foodService.dispNameData();
		request.setAttribute("qy", list);
		request.getRequestDispatcher("/pages/inspect/dining.jsp").forward(request, response);
	}

	public void add_jdjc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map map = request.getParameterMap();
		Food_jdjc food_jdjc = CommonUtils.toBean(map, Food_jdjc.class);
		foodService.add_jdjc(food_jdjc);
		request.setAttribute("success", "提交成功");
		request.getRequestDispatcher("/CriculateServlet?method=dispNameData").forward(request, response);
	}

	// 获取查询监督检查数据
	// http://localhost:8080/tslanpu/ProductionServlet?method=getjdjcData&id=119
	public void getjdjcData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Food_jdjc food_jdjc;
		food_jdjc = foodService.getjdjcData(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("iddata", food_jdjc);
		request.getRequestDispatcher("/pages/inspect/dining.jsp").forward(request, response);
	}

	public void ajaxFull(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse) response).addHeader("Access-Control-Allow-Origin", "*");
		Food byqynameCri = foodService.byqynameFull(request.getParameter("qyname"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("byqynameData", byqynameCri);
		JSON jsonData = JSONObject.fromObject(map);
		response.getWriter().print(jsonData);
	}
}
