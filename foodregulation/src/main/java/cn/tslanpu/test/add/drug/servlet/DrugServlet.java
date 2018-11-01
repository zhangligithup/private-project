package cn.tslanpu.test.add.drug.servlet;

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

import cn.tslanpu.test.add.drug.domain.Drug;
import cn.tslanpu.test.add.drug.domain.Drug_jdjc;
import cn.tslanpu.test.add.drug.service.DrugService;

import cn.tslanpu.test.utils.BaseServlet;

public class DrugServlet extends BaseServlet {

	private static final long serialVersionUID = 5540405276170726089L;
	private DrugService drugService = new DrugService();

	// 插入信息
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			Map map = request.getParameterMap();
			Drug drug = CommonUtils.toBean(map, Drug.class);
			arrToStr(request, response, drug);
			drugService.add(drug);
			out.println(1);
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
			Drug drug = CommonUtils.toBean(map, Drug.class);
			arrToStr(request, response, drug);
			// 获取当前Id根据id查询及修改
			drug.setId(Integer.parseInt(request.getParameter("idD")));
			// 更新
			drugService.Update(drug);
			request.setAttribute("drug", drug);
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
				drugService.delete(Integer.parseInt(str));
			} catch (RuntimeException e) {
				response.getWriter().print(0);
			}
		}
		response.getWriter().print(1);
	}

	// 打印
	public void print(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 根据id查询所属分局
		String str = request.getParameter("idD");
		int id = Integer.parseInt(str);
		Drug drug = drugService.drugFind(id);
		String[] arr = drug.getJyrange().split(",");
		request.setAttribute("jyrange", arr);
		request.setAttribute("drug", drug);
		request.getRequestDispatcher("/pages/tables/drug/downloadDrugInformation.jsp").forward(request, response);
	}

	// 查看详细信息
	public void infor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 根据id查询所属分局
		String str = request.getParameter("enterpriseId");
		int id = Integer.parseInt(str);
		Drug drug = drugService.drugFind(id);

		// 保存当前页码
		String pageCode = request.getParameter("pageCode");
		request.setAttribute("pageCode", pageCode);

		// 保存当前所属部门
		String name = request.getParameter("item");
		request.setAttribute("item", name);

		request.setAttribute("drug", drug);
		request.getRequestDispatcher("/pages/tables/drug/drugInformation.jsp").forward(request, response);
	}

	private void arrToStr(HttpServletRequest request, HttpServletResponse response, Drug drug) {

		String jyrange = "";

		String[] Range = request.getParameterValues("jyrange");

		if (Range != null) {
			for (int i = 0; i < Range.length; i++) {
				jyrange += Range[i];
				if (i != Range.length - 1)
					jyrange += ",";
			}
		}

		drug.setJyrange(jyrange);
	}

	// 作用于通过关键字来获取被检查单位名称
	public void dispNameData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		list = drugService.dispNameData();
		request.setAttribute("qy", list);
		request.getRequestDispatcher("/pages/inspect/drugregular.jsp").forward(request, response);
	}

	// ajax补全
	public void ajaxFull(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse) response).addHeader("Access-Control-Allow-Origin", "*");
		Drug byqynameData = drugService.byqynameFull(request.getParameter("qyname"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("byqynameData", byqynameData);
		JSON jsonData = JSONObject.fromObject(map);
		response.getWriter().print(jsonData);
	}

	// 获取查询监督检查数据
	// http://localhost:8080/tslanpu/ProductionServlet?method=getjdjcData&id=119
	public void getjdjcData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Drug_jdjc drug_jdjc;
		drug_jdjc = drugService.getjdjcData(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("iddata", drug_jdjc);
		request.getRequestDispatcher("/pages/inspect/drugregular.jsp").forward(request, response);
	}
}
