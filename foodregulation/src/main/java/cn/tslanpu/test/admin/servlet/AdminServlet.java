package cn.tslanpu.test.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.foodregulation.dao.entity.Dictionary;
import com.foodregulation.dao.mapper.DictionaryMapper;
import com.foodregulation.service.Dictionary.DictionaryService;
import com.foodregulation.service.person.PersonInfoService;

import cn.tslanpu.test.action.service.ActionService;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.admin.service.AdminService;
import cn.tslanpu.test.unit.Service.AddressService;
import cn.tslanpu.test.unit.Service.UnitService;

public class AdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AdminService adminService = new AdminService();

    private AddressService addressService = new AddressService();

    private UnitService unitService = new UnitService();
    
    private PersonInfoService personInfoService; 

    private DictionaryService dictionaryService;

    public void init() throws ServletException {
    	personInfoService = (PersonInfoService)WebApplicationContextUtils
    	                 .getWebApplicationContext(getServletContext()).getBean("personInfoService");
    	dictionaryService = (DictionaryService)WebApplicationContextUtils
                .getWebApplicationContext(getServletContext()).getBean("dictionaryService");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        ((HttpServletResponse) response).addHeader("Access-Control-Allow-Origin", "*");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Admin admin = adminService.query(username, password);
        if (admin!=null) {
            // 保存用户到session
            request.getSession().setAttribute("sessionAdmin", admin);

            // 保存所有行政区域到session中
            List<Dictionary> addressList = addressService.queryAddress();
            request.getSession().setAttribute("addressList", addressList);
            
            //保存人员的信息到session
            String personId = personInfoService.findPersonByName(username).getPersonId()+"";
            request.getSession().setAttribute("personId", personId);//登录人员ID
            request.getSession().setAttribute("uitId", personInfoService.findPersonByName(username).getPersonCompanyId());//登录人员单位ID
            String uitcode = dictionaryService.selectByPrimaryKey(personInfoService.findPersonByName(username).getPersonCompanyId()).gettDictionaryCode();
            request.getSession().setAttribute("uitcode", uitcode);//登录人员单位Code
          

            /*
             * 1.查询所有单位,监管单位 2.保存到session域
             */
            List<Dictionary> unitList = unitService.query();
            request.getSession().setAttribute("unitList", unitList);

            // 保存企业类别到session
            List<Dictionary> enterpriseTypeList = unitService.queryEnterpriseInfo();
            request.getSession().setAttribute("enterpriseTypeList", enterpriseTypeList);

            // 保存经济类型到session
            List<Dictionary> economicTypeList = unitService.queryEconomic();
            request.getSession().setAttribute("economicTypeList", economicTypeList);
            
            //保存检查频次到session
            List<Dictionary> checkFrequencyList = dictionaryService.getDictionaryByType(6);
            request.getSession().setAttribute("checkFrequencyList", checkFrequencyList);
            
            // 重定向到主页
            response.sendRedirect(request.getContextPath() + "/pages/index.jsp");
        } else {
            request.setAttribute("msg", "用户名或密码不正确");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

}
