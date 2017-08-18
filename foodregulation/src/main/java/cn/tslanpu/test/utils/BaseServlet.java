package cn.tslanpu.test.utils;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.filter.GetRequest;


public class BaseServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2254593056135479190L;

	/**
	 * BaseServlet用来作为其他Servlet的父类
	 * 
	 * @author qdmmy6
	 * 
	 *  一个类多个请求处理方法，每个请求的处理方法与Service相同
	 *  原行=返回值类型 + 方法名称 + 参数列表
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if(request.getMethod().equalsIgnoreCase("get")){
			request = new GetRequest(request, "utf-8");	
		}else{
			request.setCharacterEncoding("utf-8");//处理post请求编码
		}
		response.setContentType("text/html;charset=UTF-8");//处理响应编码
		
		/**
		 * 1. 获取method方法，他是用户想调用的方法
		 * 2. 把方法名称变为Method类的实例
		 * 3. 通过invoke来调用
		 */
		String methodName = request.getParameter("method");
		Method method = null;
		/**
		 * 2.通过方法名称获取method对象
		 */
		try {
			method = this.getClass().getMethod(methodName,
					HttpServletRequest.class, HttpServletResponse.class);
		} catch (Exception e) {
			throw new RuntimeException("您调用的方法名" + methodName + "他不存在！", e);
		}
		
		/**
		 * 3. 通过method方法调用
		 */
		try {
			String result = (String)method.invoke(this, request, response);
			if(result != null && !result.trim().isEmpty()) {
				int index = result.indexOf(":");
				System.out.println(index);
				if(index == -1) {
					request.getRequestDispatcher(result).forward(request, response);
				} else {
					String start = result.substring(0, index);
					String path = result.substring(index + 1);
					if(start.equals("f")) {
						request.getRequestDispatcher(path).forward(request, response);
					} else if(start.equals("r")) {
						response.sendRedirect(request.getContextPath() + path);
					}
				}
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
