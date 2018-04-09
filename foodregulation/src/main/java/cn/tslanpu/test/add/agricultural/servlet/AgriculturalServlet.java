package cn.tslanpu.test.add.agricultural.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.tslanpu.test.add.agricultural.domain.Agricultural;
import cn.tslanpu.test.add.agricultural.service.AgriculturalService;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.utils.BaseServlet;

public class AgriculturalServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	private AgriculturalService agriculturalService = new AgriculturalService();

	// 增加信息
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			Agricultural agricultural = setBean(request, response);
			agriculturalService.add(agricultural);
			out.println(1);
		} catch (Exception e) {
			e.printStackTrace();
			out.println(0);
		}
	}

	// 查看详细信息
	public void infor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 根据id查询所属分局
		String str = request.getParameter("enterpriseId");
		int id = Integer.parseInt(str);
		Agricultural agricultural = agriculturalService.agriculturalFind(id);

		request.setAttribute("agricultural", agricultural);
		request.getRequestDispatcher("/pages/tables/agricultural/agriculturalInformation.jsp").forward(request,
				response);
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
			String str = request.getParameter("idA");
			int id = Integer.parseInt(str);

			Agricultural agricultural = setBean(request, response);

			// 更新
			agriculturalService.agriculturalUpdate(id, agricultural);

			// //回显
			agricultural = agriculturalService.agriculturalFind(id);

			request.setAttribute("agricultural", agricultural);
			out.println(1);
		} catch (Exception e) {
			e.printStackTrace();
			out.println(0);
		}
	}

	// 打印
	public void print(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 根据id查询所属分局
		String str = request.getParameter("id");
		int id = Integer.parseInt(str);
		Agricultural agricultural = agriculturalService.agriculturalFind(id);
		String[] arrManage = agricultural.getItemsOfBusiness().split(",");
		String[] arrJyType = agricultural.getJyType().split(",");
		request.setAttribute("arrJyType", arrJyType);
		request.setAttribute("arrManage", arrManage);
		request.setAttribute("agricultural", agricultural);
		request.getRequestDispatcher("/pages/tables/agricultural/downloadAgriculturalInfo.jsp").forward(request,
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
				agriculturalService.delete(id);
			} catch (RuntimeException e) {
				response.getWriter().print(0);
			}
		}
		response.getWriter().print(1);
	}

	@SuppressWarnings("unchecked")
	private Agricultural setBean(HttpServletRequest request, HttpServletResponse response) {

		Map map = request.getParameterMap();
		Agricultural agricultural = CommonUtils.toBean(map, Agricultural.class);

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
		agricultural.setJyType(jyType);

		String itemsOfBusiness = "";
		String[] itemsOfBusinessArr = request.getParameterValues("itemsOfBusiness");
		if (itemsOfBusinessArr != null) {
			for (int i = 0; i < itemsOfBusinessArr.length; i++) {
				itemsOfBusiness += itemsOfBusinessArr[i];
				if (i != itemsOfBusinessArr.length - 1) {
					itemsOfBusiness += ",";
				}
			}
		}
		agricultural.setItemsOfBusiness(itemsOfBusiness);

		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");// 得到当前修改用户
		agricultural.setAmend(admin.getName());

		return agricultural;
	}

	public void forCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("enterpriseId");
		int id = Integer.parseInt(str);
		Agricultural agricultural = this.agriculturalService.agriculturalFind(id);

		request.setAttribute("agricultural", agricultural);
		request.getRequestDispatcher("/forCode/agriculturalforCode.jsp").forward(request, response);
	}
}
