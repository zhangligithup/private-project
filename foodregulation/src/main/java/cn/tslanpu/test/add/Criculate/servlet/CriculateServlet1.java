package cn.tslanpu.test.add.Criculate.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.tslanpu.test.add.Criculate.domain.Criculate;
import cn.tslanpu.test.add.Criculate.service.CriculateService;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.utils.BaseServlet;

public class CriculateServlet1 extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private CriculateService criculateService = new CriculateService();

	// 增加信息
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			Map map = request.getParameterMap();
			Criculate criculate = CommonUtils.toBean(map, Criculate.class);
			criculateService.add(criculate);
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
		Criculate criculate = criculateService.criculateFind(id);

		// 保存当前页码
		String pageCode = request.getParameter("pageCode");
		request.setAttribute("pageCode", pageCode);

		// 保存当前所属部门
		String name = request.getParameter("item");
		request.setAttribute("item", name);

		request.setAttribute("criculate", criculate);
		request.getRequestDispatcher("/pages/tables/criculate/criculateInformation.jsp").forward(request, response);
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

			// 根据部门名称查询部门号
			// String department = request.getParameter("department");
			// String departmentId =
			// actionService.queryActionname(department).getDepartment();

			Map map = request.getParameterMap();
			Criculate criculate1 = CommonUtils.toBean(map, Criculate.class);

			Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");// 得到当前修改用户
			criculate1.setAmend(admin.getName());
			// 重新设置department
			// criculate1.setDepartment(departmentId);
			// 更新
			int num = criculateService.criculateUpdate(id, criculate1);
			if (num > 0) {
				// 回显
				Criculate criculate = criculateService.criculateFind(id);
				request.setAttribute("criculate", criculate);
			}
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
		Criculate criculate = criculateService.criculateFind(id);
		request.setAttribute("criculate", criculate);
		request.getRequestDispatcher("/pages/tables/criculate/downloadCriculateInfo.jsp").forward(request, response);
	}

	// 删除信息
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 删除信息
		String str = request.getParameter("id");
		int id;
		if (str != null && !str.trim().isEmpty()) {
			try {
				id = Integer.parseInt(str);
				criculateService.delete(id);
			} catch (RuntimeException e) {
				response.getWriter().print(0);
			}
		}
		response.getWriter().print(1);
	}
}
