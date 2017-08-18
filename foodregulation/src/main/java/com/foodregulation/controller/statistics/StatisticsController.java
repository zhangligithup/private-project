package com.foodregulation.controller.statistics;

import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodregulation.dao.entity.Dictionary;
import com.foodregulation.dao.entity.JDJCStatistics;
import com.foodregulation.dao.entity.JDJCStatisticsNode;
import com.foodregulation.service.Dictionary.DictionaryService;
import com.foodregulation.service.enterprise.EnterpriseService;
import com.foodregulation.service.statistics.StatisticsServcice;

@Controller
@RequestMapping("statistics")
public class StatisticsController {

    @Autowired
    StatisticsServcice statisticsServcice;

    @Autowired
    DictionaryService dictionaryService;
    @Autowired
    EnterpriseService enterpriseService;


    @RequestMapping("analysisShow")
    public String show() {
        return "statisticalAnalysis/statisticalAnalysis";
    }


    @RequestMapping("preJdjcStatistics")
    public String preJdjcStatistics() {
        return "statisticalAnalysis/jdjcStatistics";
    }


    @RequestMapping("preSamplingStatistics")
    public String preSamplingStatistics() {
        return "statisticalAnalysis/samplingStatistics";
    }


    @RequestMapping("preReportStatistics")
    public String preReportStatistics() {
        return "statisticalAnalysis/reportStatistics";
    }



    @RequestMapping("enterpriseTypeStatistics")
    @ResponseBody
    public Map<String, Integer> enterpriseTypeStatistics(String startTime, String endTime) throws Exception {
        Date startDate = null;
        Date endDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (!StringUtils.isEmpty(startTime)) {
            startTime = startTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            startDate = dateFormat.parse(startTime);
        }
        if (!StringUtils.isEmpty(endTime)) {
            endTime = endTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            endDate = dateFormat.parse(endTime);
        }
        return statisticsServcice.enterpriseTypeStatistics(startDate, endDate);
    }


    @RequestMapping("enterpriseAreaStatistics")
    @ResponseBody
    public Map<String, Integer> enterpriseAreaStatistics(String startTime, String endTime) throws Exception {
        Date startDate = null;
        Date endDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (!StringUtils.isEmpty(startTime)) {
            startTime = startTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            startDate = dateFormat.parse(startTime);
        }
        if (!StringUtils.isEmpty(endTime)) {
            endTime = endTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            endDate = dateFormat.parse(endTime);
        }
        return statisticsServcice.enterpriseAreaStatistics(startDate, endDate);
    }


    @RequestMapping("enterpriseUnitStatistics")
    @ResponseBody
    public Map<String, Integer> enterpriseUnitStatistics(String startTime, String endTime) throws Exception {
        Date startDate = null;
        Date endDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (!StringUtils.isEmpty(startTime)) {
            startTime = startTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            startDate = dateFormat.parse(startTime);
        }
        if (!StringUtils.isEmpty(endTime)) {
            endTime = endTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            endDate = dateFormat.parse(endTime);
        }
        return statisticsServcice.enterpriseUnitStatistics(startDate, endDate);
    }


    @RequestMapping("jdjcStatistics")
    @ResponseBody
    public List<JDJCStatistics> jdjcStatistics(String startTime, String endTime)
            throws Exception {
        Map<String, Map<String, Integer>> map = new HashMap<String, Map<String, Integer>>();
        Date startDate = null;
        Date endDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (!StringUtils.isEmpty(startTime)) {
            startTime = startTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            startDate = dateFormat.parse(startTime);
        }
        if (!StringUtils.isEmpty(endTime)) {
            endTime = endTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            endDate = dateFormat.parse(endTime);
        }
        //获取监管单位
        List<Dictionary> dictionaryCheckUnit = dictionaryService.getDictionaryByType(2);
        //Map<String,String> dictionaryCheckUnitMap = new HashMap<String,String>();
        //获取企业类型
        List<Dictionary> dictionaryEntList = dictionaryService.getDictionaryByType(1);
        //Map<String,String> dictionaryEntMap = new HashMap<String,String>();
        /*for(Dictionary dictionary:dictionaryCheckUnit){
        	dictionaryCheckUnitMap.put(dictionary.gettDictionaryCode(), dictionary.gettDictionaryName());
        }
        for(Dictionary dictionary:dictionaryEntList){
        	dictionaryCheckUnitMap.put(dictionary.gettDictionaryCode(), dictionary.gettDictionaryName());
        }*/
        // 获取企业信数量统计
        Map<String, Integer> enterpriseTypeStatistics = statisticsServcice.enterpriseTypeStatistics(null, null);
        // 已监管企业数量统计
        Map<String, Integer> jdjcStatistics = statisticsServcice.jdjcStatistics(startDate, endDate);
        
        List<JDJCStatistics> jdjcStatisticsList = new ArrayList<JDJCStatistics>();
        
        for(Dictionary dictionary:dictionaryEntList){
        	if(dictionary.gettDictionaryCode().equals("enterprise_1")){
        		continue;
        	}
        	JDJCStatistics jdjcSta = new JDJCStatistics();
        	jdjcSta.setEntTypeCode(dictionary.gettDictionaryCode());
        	jdjcSta.setEntTypeName(dictionary.gettDictionaryName());
        	jdjcSta.setTotal(enterpriseTypeStatistics.get(dictionary.gettDictionaryCode())==null?0:enterpriseTypeStatistics.get(dictionary.gettDictionaryCode()));
        	jdjcSta.setHasTotal(jdjcStatistics==null?0:jdjcStatistics.get(dictionary.gettDictionaryCode())==null?0:jdjcStatistics.get(dictionary.gettDictionaryCode()));
        	if(jdjcSta.getTotal()==0){
        		jdjcSta.setJcl("0.0");
        	}else{
        		float tem = (Float.valueOf(jdjcSta.getHasTotal())/Float.valueOf(jdjcSta.getTotal()))*100;
        		double temd = new BigDecimal(tem).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        		jdjcSta.setJcl(temd+"");
        	}
        	List<JDJCStatisticsNode> jdjcStatisticsNodeList = new ArrayList<JDJCStatisticsNode>();
        	//查询该企业类型下的监管单位
        	List<Map<String,Object>>  unitTotalMapTemp = enterpriseService.selectEnterpriseInfoGroupcheckUnit(dictionary.gettDictionaryCode());  
        	Map<String,Integer> unitTotalMap = new HashMap<String,Integer>();
        	Map<String, Integer> unitHasTotalMap = statisticsServcice.jdjcUnitStatistics(dictionary.gettDictionaryCode(), startDate, endDate);
        	for(Map<String,Object> mapTemp:unitTotalMapTemp){
        		unitTotalMap.put(mapTemp.get("department").toString(), Integer.valueOf(mapTemp.get("total").toString()));
        	}
        	for(Dictionary dictionaryUnit:dictionaryCheckUnit){
            	JDJCStatisticsNode jdjcStatisticsNode = new JDJCStatisticsNode();
            	jdjcStatisticsNode.setUnitCode(dictionaryUnit.gettDictionaryCode());
            	jdjcStatisticsNode.setUnitName(dictionaryUnit.gettDictionaryName());
            	jdjcStatisticsNode.setTotal(unitTotalMap==null?0:(unitTotalMap.get(dictionaryUnit.gettDictionaryCode())==null?0:unitTotalMap.get(dictionaryUnit.gettDictionaryCode())));
            	jdjcStatisticsNode.setHasTotal(unitHasTotalMap==null?0:(unitHasTotalMap.get(dictionaryUnit.gettDictionaryCode())==null?0:unitHasTotalMap.get(dictionaryUnit.gettDictionaryCode())));
            	if(jdjcStatisticsNode.getTotal()==0){
            		jdjcStatisticsNode.setJcl("0.0");
            	}else{
            		float tem = (Float.valueOf(jdjcStatisticsNode.getHasTotal())/Float.valueOf(jdjcStatisticsNode.getTotal()))*100;
            		double temd = new BigDecimal(tem).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
            		jdjcStatisticsNode.setJcl(temd+"");
            	}
            	jdjcStatisticsNodeList.add(jdjcStatisticsNode);
            }
            jdjcSta.setList(jdjcStatisticsNodeList);
            jdjcStatisticsList.add(jdjcSta);
        }
        return jdjcStatisticsList;
    }


    @RequestMapping("samplingStatistics")
    @ResponseBody
    public Map<String, Map<String, Integer>> samplingStatistics(String startTime, String endTime) throws Exception {
        Map<String, Map<String, Integer>> map = new HashMap<String, Map<String, Integer>>();
        Date startDate = null;
        Date endDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (!StringUtils.isEmpty(startTime)) {
            startTime = startTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            startDate = dateFormat.parse(startTime);
        }
        if (!StringUtils.isEmpty(endTime)) {
            endTime = endTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            endDate = dateFormat.parse(endTime);
        }
        Map<String, Integer> allEnterpriseTypeStatistics = statisticsServcice.samplingStatistics(startDate, endDate,
                null);
        Map<String, Integer> successEnterpriseTypeStatistics = statisticsServcice.samplingStatistics(startDate,
                endDate, "1");
        map.put("allEnterpriseTypeStatistics", allEnterpriseTypeStatistics);
        map.put("successEnterpriseTypeStatistics", successEnterpriseTypeStatistics);
        return map;
    }


    @RequestMapping("samplingUnitStatistics")
    @ResponseBody
    public Map<String, Map<String, Integer>> samplingUnitStatistics(String startTime, String endTime) throws Exception {
        Map<String, Map<String, Integer>> map = new HashMap<String, Map<String, Integer>>();
        Date startDate = null;
        Date endDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (!StringUtils.isEmpty(startTime)) {
            startTime = startTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            startDate = dateFormat.parse(startTime);
        }
        if (!StringUtils.isEmpty(endTime)) {
            endTime = endTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            endDate = dateFormat.parse(endTime);
        }
        Map<String, Integer> allMap = statisticsServcice.samplingUnitStatistics(startDate, endDate, null);
        Map<String, Integer> successMap = statisticsServcice.samplingUnitStatistics(startDate, endDate, "1");
        map.put("allEnterpriseTypeStatistics", allMap);
        map.put("successEnterpriseTypeStatistics", successMap);
        return map;
    }



    @RequestMapping("reportAreaStatistics")
    @ResponseBody
    public Map<String, Integer> reportAreaStatistics(String address, String reportTypeId, String startTime,
            String endTime) throws Exception {
        Date startDate = null;
        Date endDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (!StringUtils.isEmpty(startTime)) {
            startTime = startTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            startDate = dateFormat.parse(startTime);
        }
        if (!StringUtils.isEmpty(endTime)) {
            endTime = endTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            endDate = dateFormat.parse(endTime);
        }
        return statisticsServcice.reportAreaStatistics(address, reportTypeId, startDate, endDate);
    }


    @RequestMapping("reportTypeStatistics")
    @ResponseBody
    public Map<String, Integer> reportTypeStatistics(String address, String reportTypeId, String startTime,
            String endTime) throws Exception {
        Date startDate = null;
        Date endDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (!StringUtils.isEmpty(startTime)) {
            startTime = startTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            startDate = dateFormat.parse(startTime);
        }
        if (!StringUtils.isEmpty(endTime)) {
            endTime = endTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            endDate = dateFormat.parse(endTime);
        }
        return statisticsServcice.reportTypeStatistics(address, reportTypeId, startDate, endDate);
    }


    @RequestMapping("reportUnitStatistics")
    @ResponseBody
    public Map<String, Integer> reportUnitStatistics(String address, String reportTypeId, String startTime,
            String endTime) throws Exception {
        Date startDate = null;
        Date endDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (!StringUtils.isEmpty(startTime)) {
            startTime = startTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            startDate = dateFormat.parse(startTime);
        }
        if (!StringUtils.isEmpty(endTime)) {
            endTime = endTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            endDate = dateFormat.parse(endTime);
        }
        return statisticsServcice.reportUnitStatistics(address, reportTypeId, startDate, endDate);
    }


    @SuppressWarnings("deprecation")
    @RequestMapping("exportEnterpriseStatistics")
    public void exportEnterpriseStatistics(HttpServletRequest request, HttpServletResponse response, String startTime,
            String endTime) throws Exception {
        Date startDate = null;
        Date endDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (!StringUtils.isEmpty(startTime)) {
            startTime = startTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            startDate = dateFormat.parse(startTime);
        }
        if (!StringUtils.isEmpty(endTime)) {
            endTime = endTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            endDate = dateFormat.parse(endTime);
        }
        // 查询按地域统计
        Map<String, Integer> enterpriseAreaStatistics = statisticsServcice.enterpriseAreaStatistics(startDate, endDate);
        // 查询按类型统计
        Map<String, Integer> enterpriseTypeStatistics = statisticsServcice.enterpriseTypeStatistics(startDate, endDate);
        // 查询按监管单位统计
        Map<String, Integer> map = statisticsServcice.enterpriseUnitStatistics(startDate, endDate);
        // 声明一个工作薄
        HSSFWorkbook wb = new HSSFWorkbook();
        // 声明一个单子并命名
        HSSFSheet sheet = wb.createSheet("按企业类型");
        // 给单子名称一个长度
        sheet.setDefaultColumnWidth((short) 15);
        // 生成一个样式
        HSSFCellStyle style = wb.createCellStyle();
        // 创建第一行（也可以称为表头）
        HSSFRow row = sheet.createRow(0);
        HSSFRow row1 = sheet.createRow(1);
        // 样式字体居中
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 给表头第一行一次创建单元格
        List<Dictionary> list = dictionaryService.getDictionaryByType(1);
        for (int i = 0; i < list.size(); i++) {
            HSSFCell cell = row.createCell((short) i);
            cell.setCellValue(list.get(i).gettDictionaryName());
            cell.setCellStyle(style);
            cell = row1.createCell((short) i);
            cell.setCellValue(enterpriseTypeStatistics.get(list.get(i).gettDictionaryCode()) == null ? 0
                    : enterpriseTypeStatistics.get(list.get(i).gettDictionaryCode()));
            cell.setCellStyle(style);
        }
        // 设置地域sheet
        HSSFSheet sheet1 = wb.createSheet("按地域");
        // 给单子名称一个长度
        sheet1.setDefaultColumnWidth((short) 15);
        // 创建第一行（也可以称为表头）
        row = sheet1.createRow(0);
        row1 = sheet1.createRow(1);
        list = dictionaryService.getDictionaryByType(0);
        for (int i = 0; i < list.size(); i++) {
            HSSFCell cell = row.createCell((short) i);
            cell.setCellValue(list.get(i).gettDictionaryName());
            cell.setCellStyle(style);
            cell = row1.createCell((short) i);
            cell.setCellValue(enterpriseAreaStatistics.get(list.get(i).gettDictionaryCode()) == null ? 0
                    : enterpriseAreaStatistics.get(list.get(i).gettDictionaryCode()));
            cell.setCellStyle(style);
        }

        // 设置地域sheet
        HSSFSheet sheet2 = wb.createSheet("按监督单位");
        // 给单子名称一个长度
        sheet1.setDefaultColumnWidth((short) 15);
        // 创建第一行（也可以称为表头）
        row = sheet2.createRow(0);
        row1 = sheet2.createRow(1);
        list = dictionaryService.getDictionaryByType(2);
        for (int i = 0; i < list.size(); i++) {
            HSSFCell cell = row.createCell((short) i);
            cell.setCellValue(list.get(i).gettDictionaryName());
            cell.setCellStyle(style);
            cell = row1.createCell((short) i);
            cell.setCellValue(map.get(list.get(i).gettDictionaryCode()) == null ? 0 : map.get(list.get(i)
                    .gettDictionaryCode()));
            cell.setCellStyle(style);
        }

        response.setContentType("application/vnd.ms-excel; charset=utf-8");
        String fileName = "企业信息统计";
        if (!StringUtils.isEmpty(startTime)) {
            fileName += startTime;
        }
        if (!StringUtils.isEmpty(endTime)) {
            fileName += "-" + endTime;
        }
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + ".xls");
        response.setCharacterEncoding("utf-8");
        OutputStream fout = response.getOutputStream();
        wb.write(fout);
        fout.close();
    }


    @SuppressWarnings("deprecation")
    @RequestMapping("exportSamplingStatistics")
    public void exportSamplingStatistics(HttpServletRequest request, HttpServletResponse response, String startTime,
            String endTime) throws Exception {
        Date startDate = null;
        Date endDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (!StringUtils.isEmpty(startTime)) {
            startTime = startTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            startDate = dateFormat.parse(startTime);
        }
        if (!StringUtils.isEmpty(endTime)) {
            endTime = endTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            endDate = dateFormat.parse(endTime);
        }
        // 查询按类型统计
        Map<String, Integer> enterpriseTypeStatistics = statisticsServcice.samplingStatistics(startDate, endDate, null);
        Map<String, Integer> successMap = statisticsServcice.samplingUnitStatistics(startDate, endDate, "1");
        // 成功的抽样单
        Map<String, Integer> successEnterpriseTypeStatistics = statisticsServcice.samplingStatistics(startDate,
                endDate, "1");
        Map<String, Integer> map = statisticsServcice.samplingUnitStatistics(startDate, endDate, null);

        // 声明一个工作薄
        HSSFWorkbook wb = new HSSFWorkbook();
        // 声明一个单子并命名
        HSSFSheet sheet = wb.createSheet("按企业类型");
        // 给单子名称一个长度
        sheet.setDefaultColumnWidth((short) 32);
        // 生成一个样式
        HSSFCellStyle style = wb.createCellStyle();
        // 创建第一行（也可以称为表头）
        // 创建第一行（也可以称为表头）

        // 样式字体居中
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFRow row = sheet.createRow(0);
        HSSFRow row1 = sheet.createRow(1);
        // 给表头第一行一次创建单元格
        List<Dictionary> list = dictionaryService.getDictionaryByType(1);
        for (int i = 0; i < list.size(); i++) {
            HSSFCell cell = row.createCell((short) i);
            cell.setCellValue(list.get(i).gettDictionaryName());
            cell.setCellStyle(style);
            cell = row1.createCell((short) i);
            cell.setCellValue(map.get(list.get(i).gettDictionaryCode()) == null ? 0 : map.get(list.get(i)
                    .gettDictionaryCode()));

            cell.setCellValue("抽检数量:"
                    + (enterpriseTypeStatistics.get(list.get(i).gettDictionaryCode()) == null ? 0
                            : enterpriseTypeStatistics.get(list.get(i).gettDictionaryCode()))
                    + "合格率:"
                    + getPercent(successEnterpriseTypeStatistics.get(list.get(i).gettDictionaryCode()) == null ? 0
                            : successEnterpriseTypeStatistics.get(list.get(i).gettDictionaryCode()),
                            enterpriseTypeStatistics.get(list.get(i).gettDictionaryCode()) == null ? 0
                                    : enterpriseTypeStatistics.get(list.get(i).gettDictionaryCode())));
            cell.setCellStyle(style);
        }

        // 设置地域sheet
        HSSFSheet sheet1 = wb.createSheet("按监管单位");
        // 给单子名称一个长度
        sheet1.setDefaultColumnWidth((short) 25);
        // 创建第一行（也可以称为表头）
        // 创建第一行（也可以称为表头）
        row = sheet1.createRow(0);
        row1 = sheet1.createRow(1);
        // 给表头第一行一次创建单元格
        list = dictionaryService.getDictionaryByType(2);
        for (int i = 0; i < list.size(); i++) {
            HSSFCell cell = row.createCell((short) i);
            cell.setCellValue(list.get(i).gettDictionaryName());
            cell.setCellStyle(style);
            cell = row1.createCell((short) i);
            cell.setCellValue(map.get(list.get(i).gettDictionaryCode()) == null ? 0 : map.get(list.get(i)
                    .gettDictionaryCode()));

            cell.setCellValue("抽检数量:"
                    + (map.get(list.get(i).gettDictionaryCode()) == null ? 0 : map
                            .get(list.get(i).gettDictionaryCode()))
                    + "合格率:"
                    + getPercent(
                            successMap.get(list.get(i).gettDictionaryCode()) == null ? 0 : successMap.get(list.get(i)
                                    .gettDictionaryCode()),
                            map.get(list.get(i).gettDictionaryCode()) == null ? 0 : map.get(list.get(i)
                                    .gettDictionaryCode())));
            cell.setCellStyle(style);
        }
        response.setContentType("application/vnd.ms-excel; charset=utf-8");
        String fileName = "企业抽样检查统计";
        if (!StringUtils.isEmpty(startTime)) {
            fileName += startTime;
        }
        if (!StringUtils.isEmpty(endTime)) {
            fileName += "-" + endTime;
        }
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + ".xls");
        response.setCharacterEncoding("utf-8");
        OutputStream fout = response.getOutputStream();
        wb.write(fout);
        fout.close();
    }


    @RequestMapping("exportReportStatistics")
    @SuppressWarnings("deprecation")
    public void exportReportStatistics(HttpServletRequest request, HttpServletResponse response, String address,
            String reportTypeId, String startTime, String endTime) throws Exception {
        Date startDate = null;
        Date endDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (!StringUtils.isEmpty(startTime)) {
            startTime = startTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            startDate = dateFormat.parse(startTime);
        }
        if (!StringUtils.isEmpty(endTime)) {
            endTime = endTime.replace("年/", "-").replace("月/", "-").replace("日", "");
            endDate = dateFormat.parse(endTime);
        }
        Map<String, Integer> enterpriseAreaStatistics = statisticsServcice.reportAreaStatistics(address, reportTypeId,
                startDate, endDate);
        Map<String, Integer> map = statisticsServcice.reportTypeStatistics(address, reportTypeId, startDate, endDate);
        Map<String, Integer> unitMap = statisticsServcice.reportUnitStatistics(address, reportTypeId, startDate,
                endDate);
        // 声明一个工作薄
        HSSFWorkbook wb = new HSSFWorkbook();
        // 设置地域sheet
        HSSFSheet sheet = wb.createSheet("按地域");
        // 给单子名称一个长度
        sheet.setDefaultColumnWidth((short) 15);
        // 生成一个样式
        HSSFCellStyle style = wb.createCellStyle();
        // 样式字体居中
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFRow row = sheet.createRow(0);
        HSSFRow row1 = sheet.createRow(1);
        // 样式字体居中
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 给表头第一行一次创建单元格
        List<Dictionary> list = dictionaryService.getDictionaryByType(0);
        for (int i = 0; i < list.size(); i++) {
            HSSFCell cell = row.createCell((short) i);
            cell.setCellValue(list.get(i).gettDictionaryName());
            cell.setCellStyle(style);
            cell = row1.createCell((short) i);
            cell.setCellValue(enterpriseAreaStatistics.get(list.get(i).gettDictionaryCode()) == null ? 0
                    : enterpriseAreaStatistics.get(list.get(i).gettDictionaryCode()));
            cell.setCellStyle(style);
        }
        // 设置地域sheet
        HSSFSheet sheet1 = wb.createSheet("按投诉类型");
        // 给单子名称一个长度
        sheet1.setDefaultColumnWidth((short) 15);
        // 创建第一行（也可以称为表头）
        row = sheet1.createRow(0);
        row1 = sheet1.createRow(1);
        list = dictionaryService.getDictionaryByType(3);
        for (int i = 0; i < list.size(); i++) {
            HSSFCell cell = row.createCell((short) i);
            cell.setCellValue(list.get(i).gettDictionaryName());
            cell.setCellStyle(style);
            cell = row1.createCell((short) i);
            cell.setCellValue(map.get(list.get(i).gettDictionaryCode()) == null ? 0 : map.get(list.get(i)
                    .gettDictionaryCode()));
            cell.setCellStyle(style);
        }

        // 设置地域sheet
        sheet1 = wb.createSheet("按监管单位");
        // 给单子名称一个长度
        sheet1.setDefaultColumnWidth((short) 25);
        row = sheet1.createRow(0);
        row1 = sheet1.createRow(1);
        list = dictionaryService.getDictionaryByType(2);
        for (int i = 0; i < list.size(); i++) {
            HSSFCell cell = row.createCell((short) i);
            cell.setCellValue(list.get(i).gettDictionaryName());
            cell.setCellStyle(style);
            cell = row1.createCell((short) i);
            cell.setCellValue(unitMap.get(list.get(i).gettDictionaryCode()) == null ? 0 : unitMap.get(list.get(i)
                    .gettDictionaryCode()));
            cell.setCellStyle(style);
        }


        response.setContentType("application/vnd.ms-excel; charset=utf-8");
        String fileName = "投诉举报统计";
        if (!StringUtils.isEmpty(startTime)) {
            fileName += startTime;
        }
        if (!StringUtils.isEmpty(endTime)) {
            fileName += "-" + endTime;
        }
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + ".xls");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Connection", "close");
        OutputStream fout = response.getOutputStream();
        wb.write(fout);
        fout.close();

    }


    public static String getPercent(Integer number1, Integer number2) {
        if (0 == number2) {
            number2 = 1;
        }
        NumberFormat format = NumberFormat.getPercentInstance();// 获取格式化类实例
        format.setMinimumFractionDigits(2);// 设置小数位
        return format.format(number1 / (float) number2);// 打印计算结果
    }



}
