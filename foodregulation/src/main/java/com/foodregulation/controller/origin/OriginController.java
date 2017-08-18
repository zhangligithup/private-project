package com.foodregulation.controller.origin;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSException;
import com.foodregulation.dao.entity.AdditiveFiling;
import com.foodregulation.dao.entity.KeepRecord;
import com.foodregulation.dao.entity.PurchaseLedger;
import com.foodregulation.service.origin.OriginService;

import cn.tslanpu.test.utils.OSS;

/**
 * 产品进货台账
 */
@Controller
@RequestMapping("/origin")
public class OriginController {


    @Autowired
    OriginService originService;

    /**
     * 产品进货台账
     * @Title: purchaseLedger
     * @Description: TODO
     * @author: kongjiang
     * @return
     */
    @RequestMapping("/purchaseLedger")
    public String purchaseLedger() {
        return "origin/purchaseLedger";
    }
    
    /**
     * 产品进货台账 --详情页
     * @Title: detailPurchaseLedger
     * @Description: TODO
     * @author: kongjiang
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("/detailPurchaseLedger")
    public String detailPurchaseLedger(HttpServletRequest request,int id) {
    	request.setAttribute("id", id);
    	PurchaseLedger purchaseLedger = originService.findPurchaseLedger(id);
    	request.setAttribute("purchaseLedger", purchaseLedger);
        return "origin/detailPurchaseLedger";
    }
    /**
     * 产品进货台账 --编辑页
     * @Title: detailPurchaseLedger
     * @Description: TODO
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("/editPurchaseLedger")
    public String editPurchaseLedger(HttpServletRequest request,int id) {
    	request.setAttribute("id", id);
    	PurchaseLedger purchaseLedger = originService.findPurchaseLedger(id);
    	request.setAttribute("purchaseLedger", purchaseLedger);
    	return "origin/editPurchaseLedger";
    }
    
    /**
     * 食品添加剂备案
     * @Title: additiveFiling
     * @Description: TODO
     * @author: kongjiang
     * @return
     */
    @RequestMapping("/additiveFiling")
    public String additiveFiling() {
        return "origin/additiveFiling";
    }
    
    /**
     * 食品添加剂备案--详情页
     * @Title: detailAdditiveFiling
     * @Description: TODO
     * @author: kongjiang
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("/detailAdditiveFiling")
    public String detailAdditiveFiling(HttpServletRequest request,int id) {
    	request.setAttribute("id", id);
    	AdditiveFiling additiveFiling = originService.findAdditiveFiling(id);
    	request.setAttribute("additiveFiling", additiveFiling);
        return "origin/detailAdditiveFiling";
    }
    
    /**
     * 食品添加剂备案--详情页
     * @Title: detailAdditiveFiling
     * @Description: TODO
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("/editAdditiveFiling")
    public String editAdditiveFiling(HttpServletRequest request,int id) {
    	request.setAttribute("id", id);
    	AdditiveFiling additiveFiling = originService.findAdditiveFiling(id);
    	request.setAttribute("additiveFiling", additiveFiling);
        return "origin/editAdditiveFiling";
    }
    /*************************************产品进货台账*****************************************************/
    
    /**
     * 显示
     */
    @RequestMapping("/selectPurchaseLedger")
    @ResponseBody
    public List<PurchaseLedger> selectPurchaseLedger(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startNum", request.getParameter("startNum"));
        map.put("limit", request.getParameter("limit"));
        map.put("company", request.getParameter("company"));
        map.put("reportTime", request.getParameter("reportTime"));
        List<PurchaseLedger> result = originService.selectPurchaseLedger(map);
        return result;
    }


    /**
     * 显示（总条数）
     */
    @RequestMapping("/selectPurchaseLedgerTotal")
    @ResponseBody
    public int selectPurchaseLedgerTotal(HttpServletRequest request) {
    	Map<String, Object> map = new HashMap<String, Object>();
        map.put("company", request.getParameter("company"));
        map.put("reportTime", request.getParameter("reportTime"));
        return originService.selectPurchaseLedgerTotal(map);
    }


    /**
     * 添加
     */
    @RequestMapping("/insertPurchaseLedger")
    @ResponseBody
    public int insertPurchaseLedger(HttpServletRequest request,@RequestParam("file") MultipartFile file, PurchaseLedger record) {
    	String rootPath = request.getSession().getServletContext().getRealPath("/");
		String fileName = file.getOriginalFilename();
		String[] strArr = fileName.split("\\.");
		fileName = strArr[0]+"-"+new Date().getTime() + "." + strArr[strArr.length - 1];
		File targetFile = new File(rootPath + "file/", fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		StringBuilder url = new StringBuilder();
		// 保存
		try {
			file.transferTo(targetFile);
			url.append(request.getSession().getServletContext().getContextPath()+"/" + "file/" + fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		record.setImgUrl(url.toString());
        int num = originService.insertPurchaseLedger(record);
        return num;
    }


    /**
     * 修改
     * @throws IOException 
     * @throws ClientException 
     * @throws OSSException 
     */
    @RequestMapping("/updatePurchaseLedger")
    @ResponseBody
    public int updatePurchaseLedger(HttpServletRequest request, PurchaseLedger record){
		int num = originService.updatePurchaseLedger(record);
        return num;
    }


    /**
     * --findone
     */
    @RequestMapping("/findPurchaseLedger")
    @ResponseBody
    public PurchaseLedger findPurchaseLedger(HttpServletRequest request, Integer id) {
    	PurchaseLedger purchaseLedger = originService.findPurchaseLedger(id);
        return purchaseLedger;
    }


    /**
     * 删除
     */
    @RequestMapping("/deletePurchaseLedger")
    @ResponseBody
    public int deletePurchaseLedger(HttpServletRequest request, Integer id) {
        int num = originService.deletePurchaseLedger(id);
        return num;
    }

    /*****************************************************************食品添加剂备案********************************************************************************************/
    
    /**
     * 显示
     */
    @RequestMapping("/selectAdditiveFiling")
    @ResponseBody
    public List<AdditiveFiling> selectAdditiveFiling(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startNum", request.getParameter("startNum"));
        map.put("limit", request.getParameter("limit"));
        map.put("company", request.getParameter("company"));
        map.put("recordTime", request.getParameter("recordTime"));
        List<AdditiveFiling> result = originService.selectAdditiveFiling(map);
        return result;
    }


    /**
     * 显示（总条数）
     */
    @RequestMapping("/selectAdditiveFilingTotal")
    @ResponseBody
    public int selectAdditiveFilingTotal(HttpServletRequest request) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("company", request.getParameter("company"));
        map.put("recordTime", request.getParameter("recordTime"));
        return originService.selectAdditiveFilingTotal(map);
    }


    /**
     * 添加
     */
    @RequestMapping("/insertAdditiveFiling")
    @ResponseBody
    public int insertAdditiveFiling(HttpServletRequest request,@RequestParam("file") MultipartFile file, AdditiveFiling record) {
    	String rootPath = request.getSession().getServletContext().getRealPath("/");
		String fileName = file.getOriginalFilename();
		String[] strArr = fileName.split("\\.");
		fileName = strArr[0]+"-"+new Date().getTime() + "." + strArr[strArr.length - 1];
		File targetFile = new File(rootPath + "file/", fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		StringBuilder url = new StringBuilder();
		// 保存
		try {
			file.transferTo(targetFile);
			url.append(request.getSession().getServletContext().getContextPath()+"/" + "file/" + fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		record.setImgUrl(url.toString());
        int num = originService.insertAdditiveFiling(record);
        return num;
    }


    /**
     * 修改
     * @throws IOException 
     * @throws ClientException 
     * @throws OSSException 
     */
    @RequestMapping("/updateAdditiveFiling")
    @ResponseBody
    public int updateAdditiveFiling(HttpServletRequest request, AdditiveFiling record){
        int num = originService.updateAdditiveFiling(record);
        return num;
    }


    /**
     * 修改--findone
     */
    @RequestMapping("/findAdditiveFiling")
    @ResponseBody
    public AdditiveFiling findAdditiveFiling(HttpServletRequest request, Integer id) {
    	AdditiveFiling additiveFiling = originService.findAdditiveFiling(id);
        return additiveFiling;
    }


    /**
     * 删除
     */
    @RequestMapping("/deleteAdditiveFiling")
    @ResponseBody
    public int deleteAdditiveFiling(HttpServletRequest request, Integer id) {
        int num = originService.deleteAdditiveFiling(id);
        return num;
    }
    
    /*************************************备案登记表*****************************************************/
       
    
    /**
     * 显示
     */
    @RequestMapping("/selectKeepRecord")
    @ResponseBody
    public List<KeepRecord> selectKeepRecord(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startNum", request.getParameter("startNum"));
        map.put("limit", request.getParameter("limit"));
        map.put("additivefilingId", request.getParameter("additivefilingId"));
        List<KeepRecord> result = originService.selectKeepRecord(map);
        return result;
    }


    /**
     * 显示（总条数）
     */
    @RequestMapping("/selectKeepRecordTotal")
    @ResponseBody
    public int selectKeepRecordTotal(HttpServletRequest request) {
    	Map<String, Object> map = new HashMap<String, Object>();
        map.put("additivefilingId", request.getParameter("additivefilingId"));
        return originService.selectKeepRecordTotal(map);
    }


    /**
     * 添加
     */
    @RequestMapping("/insertKeepRecord")
    @ResponseBody
    public int insertKeepRecord(HttpServletRequest request,KeepRecord record) {
        int num = originService.insertKeepRecord(record);
        return num;
    }


    /**
     * 修改
     */
    @RequestMapping("/updateKeepRecord")
    @ResponseBody
    public int updateKeepRecord(HttpServletRequest request, KeepRecord record) {
        int num = originService.updateKeepRecord(record);
        return num;
    }


    /**
     * 修改--findone
     */
    @RequestMapping("/findKeepRecord")
    @ResponseBody
    public KeepRecord findKeepRecord(HttpServletRequest request, Integer id) {
    	KeepRecord keepRecord = originService.findKeepRecord(id);
        return keepRecord;
    }


    /**
     * 删除
     */
    @RequestMapping("/deleteKeepRecord")
    @ResponseBody
    public int deleteKeepRecord(HttpServletRequest request, Integer id) {
        int num = originService.deleteAdditiveFiling(id);
        return num;
    }
    
}
