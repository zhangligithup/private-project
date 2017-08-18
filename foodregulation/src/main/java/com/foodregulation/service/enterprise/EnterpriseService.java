package com.foodregulation.service.enterprise;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import org.apache.ibatis.annotations.Param;

public interface EnterpriseService {
	List<Map<String,Object>> selectEnterpriseInfo(Map<String,Object> param);

	List<Map<String,Object>> getEnterpriseList (Map<String,Object> param);

	int selectEnterpriseInfoTotal(Map<String,Object> param);

	long getEnterpriseListTotal(Map<String, Object> param);
	
	void excelEnterprise(String[] titles, ServletOutputStream outputStream,Map<String,Object> param);
	
    List<Map<String, Object>> getEnterpriseNameList(String tableName);

    List<Map<String, Object>> selectEnterpriseInfoGroupcheckUnit(String enterpriseType);
}
