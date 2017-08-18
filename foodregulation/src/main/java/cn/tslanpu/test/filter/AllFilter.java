package cn.tslanpu.test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class AllFilter implements Filter {
	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain arg2) throws IOException, ServletException {
			HttpServletRequest req = (HttpServletRequest)request;
			Object admin = req.getSession().getAttribute("sessionAdmin");
			if(admin == null){
				request.setAttribute("msg", "您还没有登录");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}else{
				arg2.doFilter(request, response);
			}
	}
	
	public void destroy() {

	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
