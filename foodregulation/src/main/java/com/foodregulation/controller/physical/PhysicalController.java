package com.foodregulation.controller.physical;

import com.alibaba.fastjson.JSONObject;
import com.aliyun.oss.OSSClient;
import com.foodregulation.dao.entity.EnterpriseUser;
import com.foodregulation.dao.entity.Physical;
import com.foodregulation.service.person.PersonInfoService;
import com.foodregulation.service.physical.PhysicalService;
import com.foodregulation.util.ResultUtil;

import cn.tslanpu.test.utils.OSS;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description 体检
 * @Author yangchao
 * @Date 2016/12/18.
 */
@Controller
@RequestMapping("/physical")
public class PhysicalController {
    @Autowired
    PhysicalService physicalService;

    @Autowired
    PersonInfoService personInfoService;

    @RequestMapping("/physical")
    public String physical(){
        return "physical/physical";
    }


    /**
     * 体检记录列表
     * @param request
     * @return
     */
    @RequestMapping("/selectPhysical")
    @ResponseBody
    public List<Physical> selectPhysical(HttpServletRequest request){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("type", request.getParameter("type"));//1 :已过期 2:未过期
        param.put("physicalSearch", request.getParameter("physicalSearch"));
        param.put("startNum", request.getParameter("startNum"));
        param.put("limit", request.getParameter("limit"));
        return physicalService.selectPhysical(param);
    }

    /**
     * 体检记录总数
     * @param request
     * @return
     */
    @RequestMapping("/selectPhysicalTotal")
    @ResponseBody
    public long selectPhysicalTotal(HttpServletRequest request)
    {
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("type", request.getParameter("type"));
        param.put("physicalSearch", request.getParameter("physicalSearch"));
        return physicalService.selectPhysicalTotal(param);
    }

    /**
     * 查找体检记录
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("/findPhysical")
    @ResponseBody
    public Physical findPhysical(HttpServletRequest request,Long id){
        return physicalService.findPhysical(id);
    }


    /**
     * 新增体检记录
     * @param request
     * @param physical
     * @return
     */
    @RequestMapping("/addPhysical")
    @ResponseBody
    public JSONObject addPhysical(HttpServletRequest request, Physical physical){
        boolean pageResult=false;
        try{
            if(StringUtils.isBlank(physical.getCompanyName())){
                return ResultUtil.jsonObject("false","企业名称不能为空");
            }
            if(StringUtils.isBlank(physical.getHospital())){
                return ResultUtil.jsonObject("false","体检医院不能为空");
            }
            if(StringUtils.isBlank(physical.getPhysicalName())){
                return ResultUtil.jsonObject("false","体检人姓名不能为空");
            }
            if(StringUtils.isBlank(physical.getPhone())){
                return ResultUtil.jsonObject("false","联系电话不能为空");
            }
            if(StringUtils.isBlank(physical.getPhysicalDateStr())){
                return ResultUtil.jsonObject("false","体检日期不能为空");
            }
            if(StringUtils.isBlank(physical.getReportDateStr())){
                return ResultUtil.jsonObject("false","报告日期不能为空");
            }
            if(null==physical.getEnterpriseTypeId()||"0".equals(physical.getEnterpriseTypeId())){
                return ResultUtil.appJsonObject(false,"企业类别id不能为空");
            }


            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String physicalDateStr = physical.getPhysicalDateStr().replace("年/", "-").replace("月/", "-").replace("日", "");
            physical.setPhysicalDate(dateFormat.parse(physicalDateStr));

            String reportDateStr = physical.getReportDateStr().replace("年/", "-").replace("月/", "-").replace("日", "");
            physical.setReportDate(dateFormat.parse(reportDateStr));

            EnterpriseUser enterpriseUser=physicalService.selectEnterpriseUserByUsername(physical.getPhone());
            if(enterpriseUser==null){
            	EnterpriseUser user=new EnterpriseUser();
                user.setUserName(physical.getPhone());
                user.setEnterpriseName(physical.getCompanyName());
                user.setPassword("123456");
                user.setEnterpriseTypeCode(physical.getEnterpriseTypeId());
                user.setName(physical.getPhysicalName());
                physicalService.addEnterpriseUser(user);
            }else {
                return ResultUtil.appJsonObject(false,"联系电话已存在");
            }

            MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request,
    				MultipartHttpServletRequest.class);
    		MultipartFile file = multipartRequest.getFile("file");

    		if (file != null&&file.getSize()>0) {
    			String url = new Date().getTime() + file.getOriginalFilename();
    			OSSClient ossClient = OSS.getOssClient();
    			ossClient.putObject(OSS.bucketName, url, file.getInputStream());
    			ossClient.shutdown();
    			physical.setUrl(url);
    		}
    		
            int add= physicalService.addPhysical(physical);
            if(add>0){
                pageResult=true;
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }

        return ResultUtil.jsonObject(pageResult?"true":"false","");
    }

    /**
     * 修改体检记录
     * @param request
     * @param physical
     * @physical
     */
    @RequestMapping("/updatePhysical")
    @ResponseBody
    public JSONObject updatePhysical(HttpServletRequest request,Physical physical){
        boolean pageResult=false;
        try{
            if(physical.getId()==null||physical.getId()==0){
                return ResultUtil.jsonObject("false","id不能为空");
            }
            if(StringUtils.isBlank(physical.getCompanyName())){
                return ResultUtil.jsonObject("false","企业名称不能为空");
            }
            if(StringUtils.isBlank(physical.getHospital())){
                return ResultUtil.jsonObject("false","体检医院不能为空");
            }
            if(StringUtils.isBlank(physical.getPhysicalName())){
                return ResultUtil.jsonObject("false","体检人姓名不能为空");
            }
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String physicalDateStr = physical.getPhysicalDateStr().replace("年/", "-").replace("月/", "-").replace("日", "");
            physical.setPhysicalDate(dateFormat.parse(physicalDateStr));

            String reportDateStr = physical.getReportDateStr().replace("年/", "-").replace("月/", "-").replace("日", "");
            physical.setReportDate(dateFormat.parse(reportDateStr));

            MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request,
    				MultipartHttpServletRequest.class);
    		MultipartFile file = multipartRequest.getFile("file");

    		if (file != null&&file.getSize()>0) {
    			String url = new Date().getTime() + file.getOriginalFilename();
    			OSSClient ossClient = OSS.getOssClient();
    			ossClient.putObject(OSS.bucketName, url, file.getInputStream());
    			ossClient.shutdown();
    			physical.setUrl(url);
    		}
            int add= physicalService.updatePhysical(physical);
            if(add>0){
                pageResult=true;
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }

        return ResultUtil.jsonObject(pageResult?"true":"false","");
    }


    /**
     * 删除体检记录
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("/delPhysical")
    @ResponseBody
    public JSONObject delPhysical(HttpServletRequest request,Long id){
        boolean pageResult=false;
        try{
            if(id==null||id==0){
                return ResultUtil.jsonObject("false","id为空");
            }
            int add= physicalService.delPhysical(id);
            if(add>0){
                pageResult=true;
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }

        return ResultUtil.jsonObject(pageResult?"true":"false","");
    }
}
