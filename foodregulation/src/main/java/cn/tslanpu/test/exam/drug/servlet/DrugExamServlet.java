package cn.tslanpu.test.exam.drug.servlet;

import cn.tslanpu.test.add.drug.service.DrugService;
import cn.tslanpu.test.add.health.service.HealthService;
import cn.tslanpu.test.add.medical.service.MedicalService;
import cn.tslanpu.test.utils.BaseServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DrugExamServlet
 */
public class DrugExamServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public void DrugFindQY(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	List<Map<String, String>> list = new ArrayList<Map<String, String>>();
    	list= new DrugService().qyData();
    	List<Map<String, String>> list1 = new ArrayList<Map<String, String>>();
    	list1= new HealthService().findQY();
    	List<Map<String, String>> list2 = new ArrayList<Map<String, String>>();
    	list2= new MedicalService().qyData();
    	request.setAttribute("qy", list);
    	request.setAttribute("qy1", list1);
    	request.setAttribute("qy2", list2);	
    	
    	request.getRequestDispatcher("/pages/exam/drug/drug.jsp").forward(request, response);
    }
    
    public void add(HttpServletRequest request,HttpServletResponse response){
    	
    }
}
