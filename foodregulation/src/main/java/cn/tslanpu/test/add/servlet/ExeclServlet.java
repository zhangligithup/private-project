package cn.tslanpu.test.add.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import cn.tslanpu.test.add.industry.domain.Industry;
import cn.tslanpu.test.add.industry.service.IndustryService;
import cn.tslanpu.test.add.medical.domain.Medical;
import cn.tslanpu.test.add.medical.service.MedicalService;
import cn.tslanpu.test.add.production.domain.Production;
import cn.tslanpu.test.add.production.service.ProductionService;
import cn.tslanpu.test.add.usemed.domain.Usemed;
import cn.tslanpu.test.add.usemed.service.UsemedService;
import cn.tslanpu.test.add.wine.domain.Wine;
import cn.tslanpu.test.add.wine.service.WineService;

public class ExeclServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
			
			//企业名称
			String name = request.getParameter("name");
			System.out.println(name);
			//企业类别
			String category = request.getParameter("category");
			System.out.println(category);
			//监管单位
			String department = request.getParameter("department");
			System.out.println(department);
			//企业地址
			String address = request.getParameter("address");
			System.out.println(address);
			//法定代表人
			String fddelegate = request.getParameter("fddelegate");
			System.out.println(fddelegate);
			//注册号统一社会信用代码
			String zzcode = request.getParameter("zzcode");
			//所属监管单位
			String depart = request.getParameter("depart");
			
			//得到当前登陆用户判断是否属于分局,如果属于分局,把当前分局赋给department //权限分局只能查分局，其余都可以查
//			String[] departments = {"第一分局","第二分局","第三分局","第四分局","第五分局","第六分局","第七分局"};
//			for(int i = 0; i<departments.length; i++){
//				if(depart.equals(departments[i])){
//					department = departments[i];
//				}
//			}
			
			if(category.equals("食品生产企业")){
				
				ProductionService productionService = new ProductionService();
				List<Production> list = productionService.queryAll(name.trim(), address, department, fddelegate, zzcode);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/pages/tables/production/execalProduction.jsp").forward(request, response);
			}else if(category.equals("食品流通企业")){
				
				CriculateService criculateService = new CriculateService();
				List<Criculate> list = criculateService.queryAll(name.trim(), address, department, fddelegate, zzcode);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/pages/tables/criculate/execalCriculate.jsp").forward(request, response);
				
			}else if(category.equals("食品餐饮企业")){
				
				FoodService foodService = new FoodService();
				List<Food> list = foodService.queryAll(name.trim(), address, department, fddelegate, zzcode);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/pages/tables/food/execalFood.jsp").forward(request, response);
			}else if(category.equals("保健食品销售企业")){
				
				HealthService healthService = new HealthService();
				List<Health> list = healthService.queryAll(name.trim(), address, department, fddelegate, zzcode);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/pages/tables/health/execalHealth.jsp").forward(request, response);
			}else if(category.equals("医疗器械销售企业")){
				
				MedicalService medocalService = new MedicalService();
				List<Medical> list = medocalService.queryAll(name.trim(), address, department, fddelegate, zzcode);
				
				
				
				request.setAttribute("list", list);
				request.getRequestDispatcher("/pages/tables/medical/execalMedical.jsp").forward(request, response);
			}else if(category.equals("食品五小行业")){
				
				IndustryService industryService = new IndustryService();
				List<Industry> list = industryService.queryAll(name.trim(), address, department, fddelegate, zzcode);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/pages/tables/industry/execalIndustry.jsp").forward(request, response);
			}else if(category.equals("酒类销售企业")){
				
				WineService wineService = new WineService();
				List<Wine> list = wineService.queryAll(name.trim(), address, department, fddelegate, zzcode);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/pages/tables/wine/exportWineInformation.jsp").forward(request, response);
			}else if(category.equals("药品零售企业")){
				
				DrugService drugService = new DrugService();
				List<Drug> list = drugService.queryAll(name.trim(), address, department, fddelegate, zzcode);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/pages/tables/drug/execalDrug.jsp").forward(request, response);
			}else if(category.equals("化妆品销售企业")){
				
				CosmeticService cosmeticService = new CosmeticService();
				List<Cosmetic> list = cosmeticService.queryAll(name.trim(), address, department, fddelegate, zzcode);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/pages/tables/cosmetic/execalCosmetic.jsp").forward(request, response);
			}else if(category.equals("医疗器械使用企业")){
				
				UsemedService usemedService = new UsemedService();
				List<Usemed> list = usemedService.queryAll(name.trim(), address, department, fddelegate, zzcode);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/pages/tables/usemed/execalUsemed.jsp").forward(request, response);
			}else if(category.equals("食品经营户")){
				
				AgriculturalService agriculturalService = new AgriculturalService();
				List<Agricultural> list = agriculturalService.queryAll(name.trim(), address, department, fddelegate, zzcode);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/pages/tables/agricultural/execalAgricultural.jsp").forward(request, response);
			}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
