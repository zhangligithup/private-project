package cn.tslanpu.test.add.medical.servlet;

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
import cn.tslanpu.test.add.medical.domain.Medical;
import cn.tslanpu.test.add.medical.domain.Medical_jdjc;
import cn.tslanpu.test.add.medical.service.MedicalService;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.utils.BaseServlet;

public class MedicalServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private MedicalService medicalService = new MedicalService();

	// 增加信息
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			Medical medical = setBean(request, response);
			medicalService.add(medical);
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
		Medical medical = medicalService.medicalFind(id);

		// 保存当前页码
		String pageCode = request.getParameter("pageCode");
		request.setAttribute("pageCode", pageCode);

		// 保存当前所属部门
		String name = request.getParameter("item");
		request.setAttribute("item", name);

		request.setAttribute("medical", medical);
		request.getRequestDispatcher("/pages/tables/medical/medicalInformation.jsp").forward(request, response);
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
			String str = request.getParameter("idM");
			int id = Integer.parseInt(str);

			Medical medical = setBean(request, response);

			// 更新
			medicalService.medicalUpdate(id, medical);

			// //回显
			Medical medical1 = medicalService.medicalFind(id);

			request.setAttribute("medical", medical1);
			out.println(1);
		} catch (Exception e) {
			out.println(0);
		}
	}

	// 打印
	public void print(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 根据id查询所属分局
		String str = request.getParameter("idU");
		int id = Integer.parseInt(str);
		Medical medical = medicalService.medicalFind(id);

		String[] names = medical.getName().split(",");
		String[] manufacturers = medical.getManufacturer().split(",");
		String[] guiGes = medical.getGuiGe().split(",");
		String[] priductCodes = medical.getPriductCode().split(",");
		String[] times = medical.getTime().split(",");
		String[] suppliers = medical.getSupplier().split(",");

		int length = 0;
		if (length < names.length) {
			length = names.length;
		}
		if (length < manufacturers.length) {
			length = manufacturers.length;
		}
		if (length < guiGes.length) {
			length = guiGes.length;
		}
		if (length < priductCodes.length) {
			length = priductCodes.length;
		}
		if (length < times.length) {
			length = times.length;
		}
		if (length < suppliers.length) {
			length = suppliers.length;
		}
		String[] name = new String[length];
		System.arraycopy(names, 0, name, 0, names.length);
		String[] manufacturer = new String[length];
		System.arraycopy(manufacturers, 0, manufacturer, 0, manufacturers.length);
		String[] guiGe = new String[length];
		System.arraycopy(guiGes, 0, guiGe, 0, guiGes.length);
		String[] priductCode = new String[length];
		System.arraycopy(priductCodes, 0, priductCode, 0, priductCodes.length);
		String[] time = new String[length];
		System.arraycopy(times, 0, time, 0, times.length);
		String[] supplier = new String[length];
		System.arraycopy(suppliers, 0, supplier, 0, suppliers.length);

		String[] arrayStr = new String[length * 6];

		int j = 0;
		for (int i = 0; i < length; i++) {
			arrayStr[j++] = name[i];
			arrayStr[j++] = manufacturer[i];
			arrayStr[j++] = guiGe[i];
			arrayStr[j++] = priductCode[i];
			arrayStr[j++] = supplier[i];
			arrayStr[j++] = time[i];
		}

		request.setAttribute("array", arrayStr);
		request.setAttribute("medical", medical);
		request.getRequestDispatcher("/pages/tables/medical/downloadMedicalInfo.jsp").forward(request, response);
	}

	// 删除信息
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 删除信息
		String str = request.getParameter("id");
		int id;
		if (str != null && !str.trim().isEmpty()) {
			try {
				id = Integer.parseInt(str);
				medicalService.delete(id);
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
		list = medicalService.dispNameData();
		request.setAttribute("qy", list);
		request.getRequestDispatcher("/pages/inspect/medicalregular.jsp").forward(request, response);
	}

	// ajax补全
	public void ajaxFull(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		((HttpServletResponse) response).addHeader("Access-Control-Allow-Origin", "*");
		Medical byqynameData = medicalService.byqynameFull(request.getParameter("qyname"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("byqynameData", byqynameData);
		JSON jsonData = JSONObject.fromObject(map);
		response.getWriter().print(jsonData);
	}

	// 获取查询监督检查数据
	// http://localhost:8080/tslanpu/ProductionServlet?method=getjdjcData&id=119
	public void getjdjcData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Medical_jdjc medical_jdjc;
		medical_jdjc = medicalService.getjdjcData(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("iddata", medical_jdjc);
		request.getRequestDispatcher("/pages/inspect/medicalregular.jsp").forward(request, response);
	}

	@SuppressWarnings("unchecked")
	private Medical setBean(HttpServletRequest request, HttpServletResponse response) {

		Map map = request.getParameterMap();
		Medical medical = CommonUtils.toBean(map, Medical.class);

		String name = "";
		String[] nameArr = request.getParameterValues("name");
		if (nameArr != null) {
			for (int i = 0; i < nameArr.length; i++) {
				name += nameArr[i];
				if (i != nameArr.length - 1) {
					name += ",";
				}
			}
		}
		medical.setName(name);

		String manufacturer = "";
		String[] manufacturerArr = request.getParameterValues("manufacturer");
		if (manufacturerArr != null) {
			for (int i = 0; i < manufacturerArr.length; i++) {
				manufacturer += manufacturerArr[i];
				if (i != manufacturerArr.length - 1) {
					manufacturer += ",";
				}
			}
		}
		medical.setManufacturer(manufacturer);

		String guiGe = "";
		String[] guiGeArr = request.getParameterValues("guiGe");
		if (guiGeArr != null) {
			for (int i = 0; i < guiGeArr.length; i++) {
				guiGe += guiGeArr[i];
				if (i != guiGeArr.length - 1) {
					guiGe += ",";
				}
			}
		}
		medical.setGuiGe(guiGe);

		String priductCode = "";
		String[] priductCodeArr = request.getParameterValues("priductCode");
		if (priductCodeArr != null) {
			for (int i = 0; i < priductCodeArr.length; i++) {
				priductCode += priductCodeArr[i];
				if (i != priductCodeArr.length - 1) {
					priductCode += ",";
				}
			}
		}
		medical.setPriductCode(priductCode);

		String supplier = "";
		String[] supplierArr = request.getParameterValues("supplier");
		if (supplierArr != null) {
			for (int i = 0; i < supplierArr.length; i++) {
				supplier += supplierArr[i];
				if (i != supplierArr.length - 1) {
					supplier += ",";
				}
			}
		}
		medical.setSupplier(supplier);

		String time = "";
		String[] timeArr = request.getParameterValues("time");
		if (timeArr != null) {
			for (int i = 0; i < timeArr.length; i++) {
				time += timeArr[i];
				if (i != timeArr.length - 1) {
					time += ",";
				}
			}
		}
		medical.setTime(time);

		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");// 得到当前修改用户
		medical.setAmend(admin.getName());

		return medical;
	}
}
