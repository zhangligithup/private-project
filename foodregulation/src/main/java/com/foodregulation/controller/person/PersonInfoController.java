package com.foodregulation.controller.person;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSException;
import com.foodregulation.dao.entity.PersonInfo;
import com.foodregulation.dao.entity.User;
import com.foodregulation.service.person.PersonInfoService;

import cn.tslanpu.test.utils.OSS;

/**
 * 人员基本信息
 */
@Controller
@RequestMapping("/personInfo")
public class PersonInfoController {

    @Autowired
    PersonInfoService personInfoService;


    @RequestMapping("/personInfo")
    public String personInfo() {
        return "person/personInfo";
    }


    /**
     * 人员基本信息显示
     */
    @RequestMapping("/selectPersonInfo")
    @ResponseBody
    public List<PersonInfo> selectPersonInfo(HttpServletRequest request) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("name", request.getParameter("name"));
        params.put("edepartment", request.getParameter("edepartment"));
        params.put("zfzh", request.getParameter("zfzh"));
        params.put("mobile", request.getParameter("mobile"));
        params.put("startNum", request.getParameter("startNum"));
        params.put("limit", request.getParameter("limit"));
        params.put("personCompanyId", request.getParameter("personCompanyId"));
        List<PersonInfo> result = personInfoService.selectPersonInfo(params);
        return result;
    }


    /**
     * 人员基本信息显示（总条数）
     */
    @RequestMapping("/selectPersonInfoTotal")
    @ResponseBody
    public int selectPersonInfoTotal(HttpServletRequest request) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("name", request.getParameter("name"));
        params.put("edepartment", request.getParameter("edepartment"));
        params.put("zfzh", request.getParameter("zfzh"));
        params.put("mobile", request.getParameter("mobile"));
        return personInfoService.selectPersonInfoTotal(params);
    }


    /**
     * 人员基本信息添加
     * @throws IOException 
     * @throws ClientException 
     * @throws OSSException 
     */
    @RequestMapping("/insertPersonInfo")
    @ResponseBody
    public int insertPersonInfo(HttpServletRequest request, PersonInfo personInfo) throws OSSException, ClientException, IOException {
    	MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request,
				MultipartHttpServletRequest.class);
        MultipartFile file = multipartRequest == null ? null : multipartRequest.getFile("file");

		if (file != null&&file.getSize()>0) {
			String url = new Date().getTime() + file.getOriginalFilename();
			OSSClient ossClient = OSS.getOssClient();
			ossClient.putObject(OSS.bucketName, url, file.getInputStream());
			ossClient.shutdown();
			personInfo.setImgUrl(url);
		}
        User user = new User();
        user.setUsername(personInfo.getPerosnTel());
        user.setPassword("123456");
        personInfo.setUserName(personInfo.getPerosnTel());
        int num = personInfoService.insertPersonInfo(personInfo, user);
        return num;
    }


    /**
     * 人员基本信息修改
     * @throws IOException 
     * @throws ClientException 
     * @throws OSSException 
     */
    @RequestMapping("/updatePersonInfo")
    @ResponseBody
    public int updatePersonInfo(HttpServletRequest request, PersonInfo personInfo, User user) throws OSSException, ClientException, IOException {
    	MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request,
				MultipartHttpServletRequest.class);
        MultipartFile file = multipartRequest == null ? null : multipartRequest.getFile("file");


		if (file != null&&file.getSize()>0) {
			String url = new Date().getTime() + file.getOriginalFilename();
			OSSClient ossClient = OSS.getOssClient();
			ossClient.putObject(OSS.bucketName, url, file.getInputStream());
			ossClient.shutdown();
			personInfo.setImgUrl(url);
		}
        if (!personInfo.getPerosnTel().equals("") && personInfo.getPerosnTel() != null) {
            user.setUsername(personInfo.getUserName());
            user.setPassword("123456");
        }
        int num = personInfoService.updatePersonInfo(personInfo, user);
        return num;
    }


    /**
     * 查询人员基本信息--findone
     */
    @RequestMapping("/findPersonInfo")
    @ResponseBody
    public PersonInfo findPersonInfo(HttpServletRequest request, int personId) {
        PersonInfo personInfo = personInfoService.findPersonInfo(personId);
        return personInfo;
    }


    /**
     * 人员基本信息删除
     */
    @RequestMapping("/deletePersonInfo")
    @ResponseBody
    public int deletePersonInfo(HttpServletRequest request, int personId, Integer id) {
        int num = personInfoService.deletePersonInfo(personId, id);
        return num;
    }
    
    /**
     * 根据姓名获取人员编号
     */
    @RequestMapping("getNumberByPersonName")
    @ResponseBody
    public String getNumberByPersonName(String personName){
    	Map<String,Object> param = new HashMap<String,Object>();
    	param.put("personName", personName);
    	List<PersonInfo> list = personInfoService.findPersonByParams(param);
    	if(list==null||list.size()==0){
    		return "-1";//人员不存在
    	}else if(list.size()>1){
    		return "-2";//人员重复
    	}
    	return list.get(0).getPerosnLawCard();
    }
}
