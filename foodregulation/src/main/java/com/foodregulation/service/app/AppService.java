package com.foodregulation.service.app;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.Agricultural;
import com.foodregulation.dao.entity.AppSamplingInspection;
import com.foodregulation.dao.entity.AppUserLocation;
import com.foodregulation.dao.entity.CaseInfo;
import com.foodregulation.dao.entity.Cosmetic;
import com.foodregulation.dao.entity.Criculate;
import com.foodregulation.dao.entity.Drug;
import com.foodregulation.dao.entity.Food;
import com.foodregulation.dao.entity.Health;
import com.foodregulation.dao.entity.Medical;
import com.foodregulation.dao.entity.Production;
import com.foodregulation.dao.entity.Report;
import com.foodregulation.dao.entity.SamplingInspection;
import com.foodregulation.dao.entity.SolveReport;
import com.foodregulation.dao.entity.SupervisionAndCheck;
import com.foodregulation.dao.entity.Usemed;
import com.foodregulation.dao.entity.User;
import com.foodregulation.dao.entity.Wine;

public interface AppService {

	User userLogin(Map<String, Object> param);

	List<SupervisionAndCheck> getSupervisionAndCheck(Map<String, Object> param);

	SamplingInspection getSamplingInspection(Map<String, Object> param);

	CaseInfo getCaseInfo(Map<String, Object> param);

	Report getReport(Map<String, Object> param);

	List<Report> getReportList(Map<String, Object> param);

	void insertSolveReport(SolveReport sr);

	void insertAgricultural(Agricultural a);

	void insertProduction(Production a);

	void insertCriculate(Criculate a);

	void insertFood(Food a);

	void insertHealth(Health a);

	void insertCosmetic(Cosmetic a);

	void insertDrug(Drug a);

	void insertWine(Wine a);

	void insertMedical(Medical a);

	void insertUsemed(Usemed a);
	
	/**
	 * 插入移动端用户位置
	 * @param record
	 * @return
	 */
	int insertAppUserLocation(AppUserLocation record);
	/**
	 * 获取所有企业名称
	 * @Description: TODO
	 * @author kongjiang
	 * @date 2017年3月30日 下午4:22:08
	 * @return
	 */
	List<Map<String, Object>> selectEnterpriseInfoName(Map<String, Object> map);

}
