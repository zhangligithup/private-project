package cn.tslanpu.test.add.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import cn.tslanpu.test.add.Criculate.domain.Criculate;
import cn.tslanpu.test.add.Criculate.service.CriculateService;
import cn.tslanpu.test.add.agricultural.domain.Agricultural;
import cn.tslanpu.test.add.agricultural.service.AgriculturalService;
import cn.tslanpu.test.add.cosmetic.domain.Cosmetic;
import cn.tslanpu.test.add.cosmetic.service.CosmeticService;
import cn.tslanpu.test.add.drug.domain.Drug;
import cn.tslanpu.test.add.drug.service.DrugService;
import cn.tslanpu.test.add.food.domain.Food;
import cn.tslanpu.test.add.food.service.FoodService;
import cn.tslanpu.test.add.health.domain.Health;
import cn.tslanpu.test.add.health.service.HealthService;
import cn.tslanpu.test.add.medical.domain.Medical;
import cn.tslanpu.test.add.medical.service.MedicalService;
import cn.tslanpu.test.add.production.domain.Production;
import cn.tslanpu.test.add.production.service.ProductionService;
import cn.tslanpu.test.add.usemed.domain.Usemed;
import cn.tslanpu.test.add.usemed.service.UsemedService;
import cn.tslanpu.test.add.wine.domain.Wine;
import cn.tslanpu.test.add.wine.service.WineService;
import cn.tslanpu.test.pager.PageBean;

public class QueryServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
			
			//企业名称
			String name = request.getParameter("name");
			//企业类别
			String category = request.getParameter("category");
			//监管单位
			String department = request.getParameter("department");
			//企业地址
			String address = request.getParameter("address");
			//法定代表人
			String fddelegate = request.getParameter("fddelegate");
			//注册号统一社会信用代码
			String zzcode = request.getParameter("zzcode");
			//所属监管单位
			String depart = request.getParameter("depart");
			
			
			//得到当前登陆用户判断是否属于分局,如果属于分局,把当前分局赋给department //权限分局只能查分局，其余都可以查
			String[] departments = {"第一分局","第二分局","第三分局","第四分局","第五分局","第六分局","第七分局"};
			for(int i = 0; i<departments.length; i++){
				if(depart.equals(departments[i])){
					department = departments[i];
				}
			}
			
			if(category.equals("食品生产企业")){
				int pageCode = getPageCode(request);
				ProductionService productionService = new ProductionService();
				PageBean<Production> pb = productionService.queryZ(name.trim(), address, department, fddelegate, zzcode, pageCode);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("pb", pb);
				JSON jsonData = JSONObject.fromObject(map);
				response.getWriter().print(jsonData);
				
			}else if(category.equals("食品流通企业")){
				int pageCode = getPageCode(request);
				CriculateService criculateService = new CriculateService();
				PageBean<Criculate> pb = criculateService.queryZ(name.trim(), address, department, fddelegate, zzcode,pageCode);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("pb", pb);
				JSON jsonData = JSONObject.fromObject(map);
				response.getWriter().print(jsonData);
				
			}else if(category.equals("食品餐饮企业")){
				int pageCode = getPageCode(request);
				FoodService foodService = new FoodService();
				PageBean<Food> pb = foodService.queryZ(name.trim(), address, department, fddelegate, zzcode,pageCode);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("pb", pb);
				JSON jsonData = JSONObject.fromObject(map);
				response.getWriter().print(jsonData);
				
			}else if(category.equals("保健食品销售企业")){
				
				int pageCode = getPageCode(request);
				HealthService healthService = new HealthService();
				PageBean<Health> pb = healthService.queryZ(name.trim(), address, department, fddelegate, zzcode,pageCode);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("pb", pb);
				JSON jsonData = JSONObject.fromObject(map);
				response.getWriter().print(jsonData);
			}else if(category.equals("医疗器械销售企业")){
				
				int pageCode = getPageCode(request);
				MedicalService medocalService = new MedicalService();
				PageBean<Medical> pb = medocalService.queryZ(name.trim(), address, department, fddelegate, zzcode,pageCode);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("pb", pb);
				JSON jsonData = JSONObject.fromObject(map);
				response.getWriter().print(jsonData);
			}else if(category.equals("酒类销售企业")){
				
				int pageCode = getPageCode(request);
				WineService wineService = new WineService();
				PageBean<Wine> pb = wineService.queryZ(name.trim(), address, department, fddelegate, zzcode,pageCode);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("pb", pb);
				JSON jsonData = JSONObject.fromObject(map);
				response.getWriter().print(jsonData);
			}else if(category.equals("药品零售企业")){
				
				int pageCode = getPageCode(request);
				DrugService drugService = new DrugService();
				PageBean<Drug> pb = drugService.queryZ(name.trim(), address, department, fddelegate, zzcode,pageCode);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("pb", pb);
				JSON jsonData = JSONObject.fromObject(map);
				response.getWriter().print(jsonData);
			}else if(category.equals("化妆品销售企业")){
				
				int pageCode = getPageCode(request);
				CosmeticService cosmeticService = new CosmeticService();
				PageBean<Cosmetic> pb = cosmeticService.queryZ(name.trim(), address, department, fddelegate, zzcode,pageCode);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("pb", pb);
				JSON jsonData = JSONObject.fromObject(map);
				response.getWriter().print(jsonData);
			}else if(category.equals("医疗器械使用企业")){
				
				int pageCode = getPageCode(request);
				UsemedService usemedService = new UsemedService();
				PageBean<Usemed> pb = usemedService.queryZ(name.trim(), address, department, fddelegate, zzcode,pageCode);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("pb", pb);
				JSON jsonData = JSONObject.fromObject(map);
				response.getWriter().print(jsonData);
			}else if(category.equals("食品经营户")){
				
				int pageCode = getPageCode(request);
				AgriculturalService agriculturalService = new AgriculturalService();
				PageBean<Agricultural> pb = agriculturalService.queryZ(name.trim(), address, department, fddelegate, zzcode,pageCode);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("pb", pb);
				JSON jsonData = JSONObject.fromObject(map);
				response.getWriter().print(jsonData);
			}else{
				
			}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
	
	//得到当前页码
	private int getPageCode(HttpServletRequest req){
		int pageCode = 1;
		String param = req.getParameter("pageCode");
		if(param != null && !param.trim().isEmpty()){
			try{
				pageCode = Integer.parseInt(param);
			}catch(RuntimeException e){}
		}
		return pageCode;
	}
	

}
