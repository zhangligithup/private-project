package cn.tslanpu.test.add.production.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.tslanpu.test.add.production.domain.Production;
import cn.tslanpu.test.add.production.domain.Production_jdjc;
import cn.tslanpu.test.add.production.service.ProductionService;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.utils.BaseServlet;
import cn.tslanpu.test.utils.TokenProccessor;

public class ProductionServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	private ProductionService productionService = new ProductionService();

	public void adddd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		try {
			Production production = setBean(request, response);
			productionService.add(production);
			out.println(1);
		} catch (Exception e) {
			e.printStackTrace();
			out.println(0);
		}
	}

	// 查看详细信息
	public void infor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// session得到用户信息判断权限
		/*
		 * Admin admin = (Admin)
		 * request.getSession().getAttribute("sessionAdmin"); String groups =
		 * admin.getGroupid(); String[] groupss = groups.split(",");
		 */

		// 根据id查询详细信息
		String str = request.getParameter("enterpriseId");
		int id = Integer.parseInt(str);
		Production production = productionService.productionFind(id);

		// String departmentId = production.getDepartment();

		// 根据departmentId查询单位名称
		// request.setAttribute("department",
		// actionService.query(departmentId).getActionname());

		// 判断有无权限修改当前分局信息
		/*
		 * int groupid = 0; for(String g : groupss){ if(g.equals(departmentId)){
		 * groupid = 1; } } request.getSession().setAttribute("groupid",
		 * groupid);
		 */

		// 保存当前页码
		String pageCode = request.getParameter("pageCode");
		request.setAttribute("pageCode", pageCode);

		// 保存当前所属部门
		String name = request.getParameter("item");
		request.setAttribute("item", name);

		request.setAttribute("production", production);
		request.getRequestDispatcher("/pages/tables/production/productionInformation.jsp").forward(request, response);
	}

	// 打印
	public void print(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 根据id查询所属分局
		String str = request.getParameter("idP");
		int id = Integer.parseInt(str);
		Production production = productionService.productionFind(id);

		// 产品执行标准
		String[] chanpinNames = production.getChanpinName().split(",");
		String[] zxbzNames = production.getZxbzName().split(",");
		String[] zxbzCodes = production.getZxbzCode().split(",");
		String[] beians = production.getBeian().split(",");

		int length = 0;
		if (length < chanpinNames.length) {
			length = chanpinNames.length;
		}
		if (length < zxbzNames.length) {
			length = zxbzNames.length;
		}
		if (length < zxbzCodes.length) {
			length = zxbzCodes.length;
		}
		if (length < beians.length) {
			length = beians.length;
		}
		String[] chanpinName = new String[length];
		System.arraycopy(chanpinNames, 0, chanpinName, 0, chanpinNames.length);
		String[] zxbzName = new String[length];
		System.arraycopy(zxbzNames, 0, zxbzName, 0, zxbzNames.length);
		String[] zxbzCode = new String[length];
		System.arraycopy(zxbzCodes, 0, zxbzCode, 0, chanpinNames.length);
		String[] beian = new String[length];
		System.arraycopy(beians, 0, beian, 0, beians.length);

		String[] standardArr = new String[length * 4];
		int j = 0;
		for (int i = 0; i < length; i++) {
			standardArr[j++] = chanpinName[i];
			standardArr[j++] = zxbzName[i];
			standardArr[j++] = zxbzCode[i];
			standardArr[j++] = beian[i];
		}
		request.setAttribute("standardArr", standardArr);

		// 产品明细
		String[] cpNames = production.getCpName().split(",");
		String[] guiGes = production.getGuiGe().split(",");
		String[] nianChanLiangs = production.getNianChanLiang().split(",");
		int length1 = 0;

		if (length1 < cpNames.length) {
			length1 = cpNames.length;
		}
		if (length1 < guiGes.length) {
			length1 = guiGes.length;
		}
		if (length1 < nianChanLiangs.length) {
			length1 = nianChanLiangs.length;
		}

		String[] cpName = new String[length1];
		System.arraycopy(cpNames, 0, cpName, 0, cpNames.length);
		String[] guiGe = new String[length1];
		System.arraycopy(guiGes, 0, guiGe, 0, guiGes.length);
		String[] nianChanLiang = new String[length1];
		System.arraycopy(nianChanLiangs, 0, nianChanLiang, 0, nianChanLiangs.length);

		String[] detailsArr = new String[length1 * 3];
		int k = 0;
		for (int i = 0; i < length1; i++) {
			detailsArr[k++] = cpName[i];
			detailsArr[k++] = guiGe[i];
			detailsArr[k++] = nianChanLiang[i];
		}

		request.setAttribute("detailsArr", detailsArr);

		// 食品添加剂使用情况
		String[] additives = production.getAdditive().split(",");
		String[] additiveCompositions = production.getAdditiveComposition().split(",");
		String[] addFoodNames = production.getAddFoodName().split(",");
		String[] maxAmounts = production.getMaxAmount().split(",");
		String[] amounts = production.getAmount().split(",");
		String[] handlerss = production.getHandlers().split(",");

		int length2 = 0;
		if (length2 < additives.length) {
			length2 = additives.length;
		}
		if (length2 < additiveCompositions.length) {
			length2 = additiveCompositions.length;
		}
		if (length2 < addFoodNames.length) {
			length2 = addFoodNames.length;
		}
		if (length2 < maxAmounts.length) {
			length2 = maxAmounts.length;
		}
		if (length2 < amounts.length) {
			length2 = amounts.length;
		}
		if (length2 < handlerss.length) {
			length2 = handlerss.length;
		}

		String[] additive = new String[length2];
		System.arraycopy(additives, 0, additive, 0, additives.length);
		String[] additiveComposition = new String[length2];
		System.arraycopy(additiveCompositions, 0, additiveComposition, 0, additiveCompositions.length);
		String[] addFoodName = new String[length2];
		System.arraycopy(addFoodNames, 0, addFoodName, 0, addFoodNames.length);
		String[] amount = new String[length2];
		System.arraycopy(amounts, 0, amount, 0, amounts.length);
		String[] maxAmount = new String[length2];
		System.arraycopy(maxAmounts, 0, maxAmount, 0, maxAmounts.length);
		String[] handlers = new String[length2];
		System.arraycopy(handlerss, 0, handlers, 0, handlerss.length);

		String[] conditionArr = new String[length2 * 6];
		int m = 0;
		for (int i = 0; i < length2; i++) {
			conditionArr[m++] = additive[i];
			conditionArr[m++] = additiveComposition[i];
			conditionArr[m++] = addFoodName[i];
			conditionArr[m++] = maxAmount[i];
			conditionArr[m++] = amount[i];
			conditionArr[m++] = handlers[i];
		}

		request.setAttribute("conditionArr", conditionArr);

		request.setAttribute("production", production);
		request.getRequestDispatcher("/pages/tables/production/downloadProductionInfo.jsp").forward(request, response);
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
			String str = request.getParameter("idP");
			int id = Integer.parseInt(str);

			Production production = setBean(request, response);

			// 更新
			productionService.productionUpdate(id, production);

			// 回显
			Production production1 = productionService.productionFind(id);

			request.setAttribute("production", production1);
			out.println(1);
		} catch (Exception e) {
			out.println(0);
		}
	}

	// 删除信息
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 删除信息
		String str = request.getParameter("id");
		int id;
		if (str != null && !str.trim().isEmpty()) {
			try {
				id = Integer.parseInt(str);
				productionService.delete(id);
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
		list = productionService.dispNameData();
		request.setAttribute("qy", list);
		request.getRequestDispatcher("/pages/inspect/foodregular.jsp").forward(request, response);
	}

	// 获取查询监督检查数据
	// http://localhost:8080/tslanpu/ProductionServlet?method=getjdjcData&id=119
	public void getjdjcData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Production_jdjc production_jdjc;
		production_jdjc = productionService.getjdjcData(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("iddata", production_jdjc);
		request.getRequestDispatcher("/pages/inspect/foodregular.jsp").forward(request, response);
	}

	public void add_jdjc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map map = request.getParameterMap();
		Production_jdjc production_jdjc = CommonUtils.toBean(map, Production_jdjc.class);
		productionService.add_jdjc(production_jdjc);
		request.setAttribute("success", "提交成功");
		request.getRequestDispatcher("/ProductionServlet?method=dispNameData").forward(request, response);
	}

	// 设置Bean
	@SuppressWarnings("unchecked")
	public Production setBean(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 获取一般属性值并转化成对应Bean
		Map map = request.getParameterMap();
		Production production = CommonUtils.toBean(map, Production.class);

		// 获取name属性相同的值，转换成（name,name2,name3,）形式
		String chanpinName = "";
		String[] chanpinName1 = request.getParameterValues("chanpinName");
		if (chanpinName1 != null) {
			for (int i = 0; i < chanpinName1.length; i++) {
				chanpinName += chanpinName1[i];
				if (i != chanpinName1.length - 1) {
					chanpinName += ",";
				}
			}
		}
		production.setChanpinName(chanpinName);

		String zxbzName = "";
		String[] zxbzName1 = request.getParameterValues("zxbzName");
		if (zxbzName1 != null) {
			for (int i = 0; i < zxbzName1.length; i++) {
				zxbzName += zxbzName1[i];
				if (i != zxbzName1.length - 1) {
					zxbzName += ",";
				}
			}
		}
		production.setZxbzName(zxbzName);

		String zxbzCode = "";
		String[] zxbzCode1 = request.getParameterValues("zxbzCode");
		if (zxbzCode1 != null) {
			for (int i = 0; i < zxbzCode1.length; i++) {
				zxbzCode += zxbzCode1[i];
				if (i != zxbzCode1.length - 1) {
					zxbzCode += ",";
				}
			}
		}
		production.setZxbzCode(zxbzCode);

		String beian = "";
		String[] beian1 = request.getParameterValues("beian");
		if (beian1 != null) {
			for (int i = 0; i < beian1.length; i++) {
				beian += beian1[i];
				if (i != beian1.length - 1) {
					beian += ",";
				}
			}
		}
		production.setBeian(beian);

		// 产品明细
		String cpName = "";
		String[] cpName1 = request.getParameterValues("cpName");
		if (cpName1 != null) {
			for (int i = 0; i < cpName1.length; i++) {
				cpName += cpName1[i];
				if (i != cpName1.length - 1) {
					cpName += ",";
				}
			}
		}
		production.setCpName(cpName);

		String guiGe = "";
		String[] guiGe1 = request.getParameterValues("guiGe");
		if (guiGe1 != null) {
			for (int i = 0; i < guiGe1.length; i++) {
				guiGe += guiGe1[i];
				if (i != guiGe1.length - 1) {
					guiGe += ",";
				}
			}
		}
		production.setGuiGe(guiGe);

		String nianChanLiang = "";
		String[] nianChanLiang1 = request.getParameterValues("nianChanLiang");
		if (nianChanLiang1 != null) {
			for (int i = 0; i < nianChanLiang1.length; i++) {
				nianChanLiang += nianChanLiang1[i];
				if (i != nianChanLiang1.length - 1) {
					nianChanLiang += ",";
				}
			}
		}
		production.setNianChanLiang(nianChanLiang);

		//
		String additive = "";
		String[] additive1 = request.getParameterValues("additive");
		if (additive1 != null) {
			for (int i = 0; i < additive1.length; i++) {
				additive += additive1[i];
				if (i != additive1.length - 1)
					additive += ",";
			}
		}
		production.setAdditive(additive);

		String additiveComposition = "";
		String[] additiveComposition1 = request.getParameterValues("additiveComposition");
		if (additiveComposition1 != null) {
			for (int i = 0; i < additiveComposition1.length; i++) {
				additiveComposition += additiveComposition1[i];
				if (i != additiveComposition1.length - 1) {
					additiveComposition += ",";
				}
			}
		}
		production.setAdditiveComposition(additiveComposition);

		String addFoodName = "";
		String[] addFoodName1 = request.getParameterValues("addFoodName");
		if (addFoodName1 != null) {
			for (int i = 0; i < addFoodName1.length; i++) {
				addFoodName += addFoodName1[i];
				if (i != addFoodName1.length - 1) {
					addFoodName += ",";
				}
			}
		}
		production.setAddFoodName(addFoodName);

		String maxAmount = "";
		String[] maxAmount1 = request.getParameterValues("maxAmount");
		if (maxAmount1 != null) {
			for (int i = 0; i < maxAmount1.length; i++) {
				maxAmount += maxAmount1[i];
				if (i != maxAmount1.length - 1) {
					maxAmount += ",";
				}
			}
		}
		production.setMaxAmount(maxAmount);

		String amount = "";
		String[] amount1 = request.getParameterValues("amount");
		if (amount1 != null) {
			for (int i = 0; i < amount1.length; i++) {
				amount += amount1[i];
				if (i != amount1.length - 1) {
					amount += ",";
				}
			}
		}
		production.setAmount(amount);

		String handlers = "";
		String[] handlers1 = request.getParameterValues("handlers");
		if (handlers1 != null) {
			for (int i = 0; i < handlers1.length; i++) {
				handlers += handlers1[i];
				if (i != handlers1.length - 1) {
					handlers += ",";
				}
			}
		}
		production.setHandlers(handlers);

		Admin admin = (Admin) request.getSession().getAttribute("sessionAdmin");
		production.setAmend(admin.getName());// 保存当前修改人

		return production;
	}
}
