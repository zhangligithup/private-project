package com.foodregulation.serviceImpl.enterprise;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.mapper.EnterpriseInfoMapper;
import com.foodregulation.service.enterprise.EnterpriseService;

@Service
public class EnterpriseServiceImpl implements EnterpriseService {

	@Autowired
	EnterpriseInfoMapper enterpriseInfoMapper;
	@Override
	public List<Map<String, Object>> selectEnterpriseInfo(Map<String,Object> param) {
		return enterpriseInfoMapper.selectEnterpriseInfo(param);
	}

	@Override
	public List<Map<String, Object>> getEnterpriseList(Map<String, Object> param) {
		return enterpriseInfoMapper.getEnterpriseList(param);
	}

	@Override
	public int selectEnterpriseInfoTotal(Map<String, Object> param) {
		return enterpriseInfoMapper.selectEnterpriseInfoTotal(param);
	}

	@Override
	public long getEnterpriseListTotal(Map<String, Object> param) {
		return enterpriseInfoMapper.getEnterpriseListTotal(param);
	}

	@Override
	public void excelEnterprise(String[] titles, ServletOutputStream outputStream,Map<String,Object> param) {
		List<Map<String, Object>> list = enterpriseInfoMapper.selectEnterpriseInfo(param);
        XSSFWorkbook workBook = new XSSFWorkbook();  
        XSSFSheet sheet = workBook.createSheet("企业信息");
        XSSFRow headRow = sheet.createRow(0);  
        XSSFCell cell = null;  
        for (int i = 0; i < titles.length; i++) {  
            cell = headRow.createCell(i);
            cell.setCellValue(titles[i]);  
        }  
        if (list != null && list.size() > 0) {  
            for (int j = 0; j < list.size(); j++) {  
            	XSSFRow bodyRow = sheet.createRow(j + 1);  
                
                cell = bodyRow.createCell(0);    
                cell.setCellValue(list.get(j).get("qyname").toString());//企业名称
                	
                cell = bodyRow.createCell(1); 
                cell.setCellValue(list.get(j).get("addressName").toString());//所属行政区域
               
                cell = bodyRow.createCell(2);
                cell.setCellValue(list.get(j).get("scaddress").toString());//经营场所地址(具体到摊位号)
                
                cell = bodyRow.createCell(3);
	            cell.setCellValue(list.get(j).get("qydelegate").toString()); //负责人
	            
	            cell = bodyRow.createCell(4);
	            cell.setCellValue(list.get(j).get("qyphone").toString()); //联系电话
	            
	            cell = bodyRow.createCell(5);
	            cell.setCellValue(list.get(j).get("zzcode").toString()); //注册号/统一社会信用代码
	            
	            cell = bodyRow.createCell(6);
	            cell.setCellValue(list.get(j).get("departmentName").toString()); //监管单位
	            
	            cell = bodyRow.createCell(7);
	            cell.setCellValue(list.get(j).get("scpermit").toString()); //食品经营许可证
            
	            /*cell = bodyRow.createCell(8);
	            cell.setCellValue(list.get(j).get("qydelegate").toString()); //监管人员
	            
	            cell = bodyRow.createCell(9);
	            cell.setCellValue(list.get(j).get("qydelegate").toString()); //监督人员
	            
	            cell = bodyRow.createCell(10);
	            cell.setCellValue(list.get(j).get("qydelegate").toString()); //协管人员
*/            }  
        }  
        try{  
            workBook.write(outputStream);  
            outputStream.flush();  
            outputStream.close();  
        }  
        catch (IOException e) {  
            e.printStackTrace();  
        }  
        finally {  
	        try {  
	            outputStream.close();  
	        }catch (IOException e) {  
	            e.printStackTrace();  
	        }  
        }  		
	}

	@Override
	public List<Map<String, Object>> getEnterpriseNameList(String tableName) {
		return enterpriseInfoMapper.getEnterpriseNameList(tableName);
	}

	@Override
	public List<Map<String, Object>> selectEnterpriseInfoGroupcheckUnit(String enterpriseType) {
		return enterpriseInfoMapper.selectEnterpriseInfoGroupcheckUnit(enterpriseType);
	}

	@Override
	public Integer selectEnterpriseCountByName(String qyname) {
		return enterpriseInfoMapper.selectEnterpriseCountByName(qyname);
	}

}
