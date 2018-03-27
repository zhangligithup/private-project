package cn.tslanpu.test.exam.food.servlet;

import cn.itcast.commons.CommonUtils;
import cn.tslanpu.test.add.Criculate.service.CriculateService;
import cn.tslanpu.test.add.agricultural.service.AgriculturalService;
import cn.tslanpu.test.add.food.service.FoodService;
import cn.tslanpu.test.add.production.service.ProductionService;
import cn.tslanpu.test.exam.food.domain.FoodExam1;
import cn.tslanpu.test.exam.food.service.FoodExamService;
import cn.tslanpu.test.utils.BaseServlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FoodExamServlet
 */
public class FoodExamServlet extends BaseServlet
{
	private static final long serialVersionUID = 1L;
	public FoodExamService foodExamService = new FoodExamService();


	/**
	 * Default constructor.
	 */

	/**
	 *
	 * @throws IOException
	 * @throws ServletException
	 * @throws SQLException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void findQYname(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		list=new FoodService().FindQyname();
		List<Map<String, String>> list1 = new ArrayList<Map<String, String>>();
		list1=new CriculateService().findQyname();
		List<Map<String, String>> list2 = new ArrayList<Map<String, String>>();
		list2=new ProductionService().findQyname();
		List<Map<String, String>> list4 = new ArrayList<Map<String, String>>();
		list4=new AgriculturalService().findQyName();
		request.setAttribute("qy4", list4);
		request.setAttribute("qy2", list2);
		request.setAttribute("qy1", list1);
//		System.out.println(list3);
		request.setAttribute("qy", list);
		request.getRequestDispatcher("/pages/exam/food/food.jsp").forward(request, response);
		
	}
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException
	{
		
		request.setCharacterEncoding("utf-8");		
		FoodExam1 f = setBean(request, response);
		foodExamService.add(f);
		request.setAttribute("success", "提交成功");
		request.getRequestDispatcher("/FoodServlet?method=findQYname").forward(request, response);

	}

	private FoodExam1 setBean(HttpServletRequest request, HttpServletResponse response)
	{
		Map map = request.getParameterMap();
		FoodExam1 foodEx1 = CommonUtils.toBean(map, FoodExam1.class);
		String d6sampleno = "";
 		String[] d6sampleno1 = request.getParameterValues("d6sampleno");
 		if(d6sampleno1 != null){
 			for(int i = 0; i<d6sampleno1.length; i++){
 				d6sampleno +=d6sampleno1[i];
 	 			if(i != d6sampleno1.length-1){
 	 				d6sampleno += ",";
 	 			}
 			}
		}
 		foodEx1.setD6sampleno(d6sampleno);
 		
 		String d6samplename = "";
 		String[] d6samplename1 = request.getParameterValues("d6samplename");
 		if(d6samplename1 != null){
 			for(int i = 0; i<d6samplename1.length; i++){
 				d6samplename +=d6samplename1[i];
 	 			if(i != d6samplename1.length-1){
 	 				d6samplename += ",";
 	 			}
 			}
		}
 		foodEx1.setD6samplename(d6samplename);
 		
 		String d6package = "";
 		String[] d6package1 = request.getParameterValues("d6package");
 		if(d6package1 != null){
 			for(int i = 0; i<d6package1.length; i++){
 				d6package +=d6package1[i];
 	 			if(i != d6package1.length-1){
 	 				d6package += ",";
 	 			}
 			}
		}
 		foodEx1.setD6package(d6package);
 		
 		String d6productserial = "";
 		String[] d6productserial1 = request.getParameterValues("d6productserial");
 		if(d6productserial1 != null){
 			for(int i = 0; i<d6productserial1.length; i++){
 				d6productserial +=d6productserial1[i];
 	 			if(i != d6productserial1.length-1){
 	 				d6productserial += ",";
 	 			}
 			}
		}
 		foodEx1.setD6productserial(d6productserial);
 		
 		String d6size = "";
 		String[] d6size1 = request.getParameterValues("d6size");
 		if(d6size1 != null){
 			for(int i = 0; i<d6size1.length; i++){
 				d6size +=d6size1[i];
 	 			if(i != d6size1.length-1){
 	 				d6size += ",";
 	 			}
 			}
		}
 		foodEx1.setD6size(d6size);
 		
 		String d6examedtype = "";
 		String[] d6examedtype1 = request.getParameterValues("d6examedtype");
 		if(d6examedtype1 != null){
 			for(int i = 0; i<d6examedtype1.length; i++){
 				d6examedtype +=d6examedtype1[i];
 	 			if(i != d6examedtype1.length-1){
 	 				d6examedtype += ",";
 	 			}
 			}
		}
 		foodEx1.setD6examedtype(d6examedtype);
 		
 		String d6productdw = "";
 		String[] d6productdw1 = request.getParameterValues("d6productdw");
 		if(d6productdw1 != null){
 			for(int i = 0; i<d6productdw1.length; i++){
 				d6productdw +=d6productdw1[i];
 	 			if(i != d6productdw1.length-1){
 	 				d6productdw += ",";
 	 			}
 			}
		}
 		foodEx1.setD6productdw(d6productdw);
 		
 		String d6exameddwname = "";
 		String[] d6exameddwname1 = request.getParameterValues("d6exameddwname");
 		if(d6exameddwname1 != null){
 			for(int i = 0; i<d6exameddwname1.length; i++){
 				d6exameddwname +=d6exameddwname1[i];
 	 			if(i != d6exameddwname1.length-1){
 	 				d6exameddwname += ",";
 	 			}
 			}
		}
 		foodEx1.setD6exameddwname(d6exameddwname);
 		
 		String d6exameddwdz = "";
 		String[] d6exameddwdz1 = request.getParameterValues("d6exameddwdz");
 		if(d6exameddwdz1 != null){
 			for(int i = 0; i<d6exameddwdz1.length; i++){
 				d6exameddwdz+=d6exameddwdz1[i];
 	 			if(i != d6exameddwdz1.length-1){
 	 				d6exameddwdz += ",";
 	 			}
 			}
		}
 		foodEx1.setD6exameddwdz(d6exameddwdz);
 		
 		String d9examedfood = "";
 		String[] d9examedfood1 = request.getParameterValues("d9examedfood");
 		if(d9examedfood1 != null){
 			for(int i = 0; i<d9examedfood1.length; i++){
 				d9examedfood+=d9examedfood1[i];
 	 			if(i != d9examedfood1.length-1){
 	 				d9examedfood += ",";
 	 			}
 			}
		}
 		foodEx1.setD9examedfood(d9examedfood);
 		
 		String d9size = "";
 		String[] d9size1 = request.getParameterValues("d9size");
 		if(d9size1 != null){
 			for(int i = 0; i<d9size1.length; i++){
 				d9size+=d9size1[i];
 	 			if(i != d9size1.length-1){
 	 				d9size+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9size(d9size);
 		
 		String d9exampepl = "";
 		String[] d9exampepl1 = request.getParameterValues("d9exampepl");
 		if(d9size1 != null){
 			for(int i = 0; i<d9exampepl1.length; i++){
 				d9exampepl+=d9exampepl1[i];
 	 			if(i != d9exampepl1.length-1){
 	 				d9exampepl+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9exampepl(d9exampepl);
 		
 		String d9examedpepl = "";
 		String[] d9examedpepl1 = request.getParameterValues("d9examedpepl");
 		if(d9size1 != null){
 			for(int i = 0; i<d9examedpepl1.length; i++){
 				d9examedpepl+=d9examedpepl1[i];
 	 			if(i != d9examedpepl1.length-1){
 	 				d9examedpepl+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9examedpepl(d9examedpepl);
 		
 		String d9examsite = "";
 		String[] d9examsite1 = request.getParameterValues("d9examsite");
 		if(d9size1 != null){
 			for(int i = 0; i<d9examsite1.length; i++){
 				d9examsite+=d9examsite1[i];
 	 			if(i != d9examsite1.length-1){
 	 				d9examsite+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9examsite(d9examsite);
 		
 		String d9examtime = "";
 		String[] d9examtime1 = request.getParameterValues("d9examtime");
 		if(d9size1 != null){
 			for(int i = 0; i<d9examtime1.length; i++){
 				d9examtime+=d9examtime1[i];
 	 			if(i != d9examtime1.length-1){
 	 				d9examtime+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9examtime(d9examtime);
 		
 		String d9examedsign = "";
 		String[] d9examedsign1 = request.getParameterValues("d9examedsign");
 		if(d9size1 != null){
 			for(int i = 0; i<d9examedsign1.length; i++){
 				d9examedsign+=d9examedsign1[i];
 	 			if(i != d9examedsign1.length-1){
 	 				d9examedsign+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9examedsign(d9examedsign);
 		
 		String d9examitem = "";
 		String[] d9examitem1 = request.getParameterValues("d9examitem");
 		if(d9size1 != null){
 			for(int i = 0; i<d9examitem1.length; i++){
 				d9examitem+=d9examitem1[i];
 	 			if(i != d9examitem1.length-1){
 	 				d9examitem+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9examitem(d9examitem);
 		
 		String d9standard = "";
 		String[] d9standard1 = request.getParameterValues("d9standard");
 		if(d9size1 != null){
 			for(int i = 0; i<d9standard1.length; i++){
 				d9standard+=d9standard1[i];
 	 			if(i != d9standard1.length-1){
 	 				d9standard+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9standard(d9standard);
 		
 		String d9examresult = "";
 		String[] d9examresult1 = request.getParameterValues("d9examresult");
 		if(d9size1 != null){
 			for(int i = 0; i<d9examresult1.length; i++){
 				d9examresult+=d9examresult1[i];
 	 			if(i != d9examresult1.length-1){
 	 				d9examresult+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9examresult(d9examresult);
 		
 		String d9examvalue = "";
 		String[] d9examvalue1 = request.getParameterValues("d9examvalue");
 		if(d9size1 != null){
 			for(int i = 0; i<d9examvalue1.length; i++){
 				d9examvalue+=d9examvalue1[i];
 	 			if(i != d9examvalue1.length-1){
 	 				d9examvalue+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9examvalue(d9examvalue);
 		
 		String d9examersign = "";
 		String[] d9examersign1 = request.getParameterValues("d9examersign");
 		if(d9size1 != null){
 			for(int i = 0; i<d9examersign1.length; i++){
 				d9examersign+=d9examersign1[i];
 	 			if(i != d9examersign1.length-1){
 	 				d9examersign+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9examersign(d9examersign);
 		
 		String d9examestua = "";
 		String[] d9examestua1 = request.getParameterValues("d9examestua");
 		if(d9examestua1 != null){
 			for(int i = 0; i<d9examestua1.length; i++){
 				d9examestua+=d9examestua1[i];
 	 			if(i != d9examestua1.length-1){
 	 				d9examestua+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9examestua(d9examestua);
 		
 		String d9remark = "";
 		String[] d9remark1 = request.getParameterValues("d9remark");
 		if(d9size1 != null){
 			for(int i = 0; i<d9remark1.length; i++){
 				d9remark+=d9remark1[i];
 	 			if(i != d9remark1.length-1){
 	 				d9remark+= ",";
 	 			}
 			}
		}
 		foodEx1.setD9remark(d9remark);
		return foodEx1;
	}

}
