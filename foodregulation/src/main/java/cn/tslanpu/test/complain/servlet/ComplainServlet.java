package cn.tslanpu.test.complain.servlet;


import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.tslanpu.test.complain.domain.Complain;
import cn.tslanpu.test.complain.service.ComplainService;
import cn.tslanpu.test.utils.BaseServlet;

public class ComplainServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;

	private ComplainService complainService = new ComplainService();
	
	//添加
	public void add(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		
		Complain complain = setBean(request, response);
		complain.setResult("0");	//0代表未处理
		complainService.add(complain);
		request.setAttribute("success", "提交成功");
		request.getRequestDispatcher("/pages/complain/complain.jsp").forward(request, response);
	}
	
	//添加
	public void query(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		
		int id = Integer.parseInt(request.getParameter("id"));
	
		Complain complain = complainService.complainFind(id);
		request.setAttribute("complain", complain);
		request.getRequestDispatcher("/pages/complain/complainUpdate.jsp").forward(request, response);
	}
	
	//添加
	public void update(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		Complain complainAdd = setBean(request, response);
		complainAdd.setResult("1");	//1 代表已经处理
		int id = Integer.parseInt(request.getParameter("id"));
		
		complainService.update(id, complainAdd);
		
		request.getRequestDispatcher("/pages/index.jsp").forward(request, response);
	}
	
	//设置Bean
	@SuppressWarnings("unchecked")
	public Complain setBean(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		//获取一般属性值并转化成对应Bean
		Map map = request.getParameterMap();
		Complain complain = CommonUtils.toBean(map, Complain.class);
		
		
		//获取name属性相同的值，转换成（name,name2,name3,）形式
		String type = "";
 		String[] typeArray = request.getParameterValues("type");
 		if(typeArray != null){
 			for(int i = 0; i<typeArray.length; i++){
 				type +=typeArray[i];
 	 			if(i != typeArray.length-1){
 	 				type += ",";
 	 			}
 			}
		}
 		complain.setType(type);
 		
 		String mode = "";
 		String[] modeArray = request.getParameterValues("mode");
 		if(modeArray != null){
	 		for(int i = 0; i<modeArray.length; i++){
	 			mode +=modeArray[i];
	 			if(i != modeArray.length-1){
	 				mode += ",";
	 			}
			}
 		}
 		complain.setMode(mode);
 		
		return complain;
	}
}
