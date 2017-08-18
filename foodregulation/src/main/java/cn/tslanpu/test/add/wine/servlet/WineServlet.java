package cn.tslanpu.test.add.wine.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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

import cn.tslanpu.test.add.wine.domain.Wine;
import cn.tslanpu.test.add.wine.domain.Wine_jdjc;
import cn.tslanpu.test.add.wine.service.WineService;

import cn.tslanpu.test.utils.BaseServlet;

public class WineServlet extends BaseServlet {
	private WineService wineService = new WineService();

	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			Map map = request.getParameterMap();
			Wine wine = CommonUtils.toBean(map, Wine.class);
			arrToStr(request, response, wine);
			wineService.add(wine);
		} catch (Exception e) {
			out.println(0);
		}
	}

	// 更新信息
	public void update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			// 判断返回的状态
			request.setAttribute("status", 2);
			Map map = request.getParameterMap();
			Wine wine = CommonUtils.toBean(map, Wine.class);
			arrToStr(request, response, wine);
			// 获取当前Id根据id查询及修改
			wine.setId(Integer.parseInt(request.getParameter("idW")));
			// 更新
			wineService.Update(wine);
			request.setAttribute("wine", wine);
			out.println(1);
		} catch (Exception e) {
			out.println(0);
		}
	}

	// 删除信息
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 删除信息
		String str = request.getParameter("id");

		if (str != null && !str.trim().isEmpty()) {
			try {
				wineService.delete(Integer.parseInt(str));
			} catch (RuntimeException e) {
				response.getWriter().print(0);
			}
		}
		response.getWriter().print(1);
	}

	// 打印
	public void print(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 根据id查询所属分局
		String str = request.getParameter("idW");
		int id = Integer.parseInt(str);
		Wine wine = wineService.wineFind(id);
		String[] arr1 = wine.getJytype().split(",");
		request.setAttribute("type", arr1);
		String[] arr2 = wine.getJyrange().split(",");
		request.setAttribute("range", arr2);
		request.setAttribute("wine", wine);
		request.getRequestDispatcher("/pages/tables/wine/downloadWineInformation.jsp").forward(request, response);
	}

	// export excel
	public void exprotExcel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 根据id查询所属分局
		String str = request.getParameter("idW");
		int id = Integer.parseInt(str);
		Wine wine = wineService.wineFind(id);
		String[] arr1 = wine.getJytype().split(",");
		request.setAttribute("type", arr1);
		String[] arr2 = wine.getJyrange().split(",");
		request.setAttribute("range", arr2);
		request.setAttribute("wine", wine);
		request.getRequestDispatcher("/pages/tables/wine/exportWineInformation.jsp").forward(request, response);
	}

	// 查看详细信息
	public void infor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 根据id查询所属分局
		String str = request.getParameter("enterpriseId");
		int id = Integer.parseInt(str);
		Wine wine = wineService.wineFind(id);

		// 保存当前页码
		String pageCode = request.getParameter("pageCode");
		request.setAttribute("pageCode", pageCode);

		// 保存当前所属部门
		String name = request.getParameter("item");
		request.setAttribute("item", name);

		request.setAttribute("wine", wine);
		request.getRequestDispatcher("/pages/tables/wine/wineInformation.jsp").forward(request, response);
	}

	// 作用于通过关键字来获取被检查单位名称
	public void dispNameData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		list = wineService.dispNameData();
		request.setAttribute("qy", list);
		request.getRequestDispatcher("/pages/inspect/wineregular.jsp").forward(request, response);
	}

	public void add_jdjc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map map = request.getParameterMap();
		Wine_jdjc wine_jdjc = CommonUtils.toBean(map, Wine_jdjc.class);
		wineService.add_jdjc(wine_jdjc);
		request.setAttribute("success", "提交成功");
		request.getRequestDispatcher("/WineServlet?method=dispNameData").forward(request, response);
	}

	// 获取查询监督检查数据
	// http://localhost:8080/tslanpu/ProductionServlet?method=getjdjcData&id=119
	public void getjdjcData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Wine_jdjc wine_jdjc;
		wine_jdjc = wineService.getjdjcData(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("iddata", wine_jdjc);
		request.getRequestDispatcher("/pages/inspect/wineregular.jsp").forward(request, response);
	}

	public void ajaxFull(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse) response).addHeader("Access-Control-Allow-Origin", "*");
		Wine byqynameWine = wineService.byqynameFull(request.getParameter("qyname"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("byqynameData", byqynameWine);
		JSON jsonData = JSONObject.fromObject(map);
		response.getWriter().print(jsonData);
	}

	private void arrToStr(HttpServletRequest request, HttpServletResponse response, Wine wine) {
		String jytype = "";
		String jyrange = "";
		String[] Type = request.getParameterValues("type");
		String[] Range = request.getParameterValues("range");
		if (Type != null) {
			for (int i = 0; i < Type.length; i++) {
				jytype += Type[i];
				if (i != Type.length - 1)
					jytype += ",";
			}
		}
		if (Range != null) {
			for (int i = 0; i < Range.length; i++) {
				jyrange += Range[i];
				if (i != Range.length - 1)
					jyrange += ",";
			}
		}
		wine.setJytype(jytype);
		wine.setJyrange(jyrange);
	}

}
