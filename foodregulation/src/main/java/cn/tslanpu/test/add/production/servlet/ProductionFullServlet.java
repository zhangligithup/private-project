package cn.tslanpu.test.add.production.servlet;

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
	import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.pager.PageBean;

	public class ProductionFullServlet extends HttpServlet {
		
		private static final long serialVersionUID = 1L;
		private ProductionService productionService = new ProductionService();
		public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
				response.setContentType("text/html;charset=utf-8");
				((HttpServletResponse)response).addHeader("Access-Control-Allow-Origin", "*");
				Production byqynamePro = productionService.byqynameFull(request.getParameter("qyname"));
				Map<String, Object> map = new HashMap<String, Object>();
						map.put("byqynameData", byqynamePro);
						JSON jsonData = JSONObject.fromObject(map);
						response.getWriter().print(jsonData);
		}

		public void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			doGet(request, response);
		}
		
	
		

	}
