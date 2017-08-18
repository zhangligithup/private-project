package com.foodregulation.serviceImpl.app;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.Agricultural;
import com.foodregulation.dao.entity.AppUserLocation;
import com.foodregulation.dao.entity.CaseInfo;
import com.foodregulation.dao.entity.Cosmetic;
import com.foodregulation.dao.entity.Criculate;
import com.foodregulation.dao.entity.Drug;
import com.foodregulation.dao.entity.EnterpriseUser;
import com.foodregulation.dao.entity.Food;
import com.foodregulation.dao.entity.Health;
import com.foodregulation.dao.entity.Industry;
import com.foodregulation.dao.entity.Medical;
import com.foodregulation.dao.entity.Production;
import com.foodregulation.dao.entity.Report;
import com.foodregulation.dao.entity.SamplingInspection;
import com.foodregulation.dao.entity.SolveReport;
import com.foodregulation.dao.entity.SupervisionAndCheck;
import com.foodregulation.dao.entity.Usemed;
import com.foodregulation.dao.entity.User;
import com.foodregulation.dao.entity.Wine;
import com.foodregulation.dao.mapper.AgriculturalMapper;
import com.foodregulation.dao.mapper.AppUserLocationMapper;
import com.foodregulation.dao.mapper.CaseInfoMapper;
import com.foodregulation.dao.mapper.CosmeticMapper;
import com.foodregulation.dao.mapper.CriculateMapper;
import com.foodregulation.dao.mapper.DrugMapper;
import com.foodregulation.dao.mapper.EnterpriseInfoMapper;
import com.foodregulation.dao.mapper.EnterpriseUserMapper;
import com.foodregulation.dao.mapper.FoodMapper;
import com.foodregulation.dao.mapper.HealthMapper;
import com.foodregulation.dao.mapper.IndustryMapper;
import com.foodregulation.dao.mapper.MedicalMapper;
import com.foodregulation.dao.mapper.ProductionMapper;
import com.foodregulation.dao.mapper.ReportMapper;
import com.foodregulation.dao.mapper.SamplingInspectionMapper;
import com.foodregulation.dao.mapper.SolveReportMapper;
import com.foodregulation.dao.mapper.SupervisionAndCheckMapper;
import com.foodregulation.dao.mapper.UsemedMapper;
import com.foodregulation.dao.mapper.UserMapper;
import com.foodregulation.dao.mapper.WineMapper;
import com.foodregulation.service.app.AppService;

@Service
public class AppServiceImpl implements AppService{
	
	@Autowired
	UserMapper userMapper;
	@Autowired
	SupervisionAndCheckMapper supervisionAndCheckMapper;
	@Autowired
	SamplingInspectionMapper samplingInspectionMapper;
	@Autowired
	CaseInfoMapper caseInfoMapperMapper;
	@Autowired
	ReportMapper reportMapper;
	@Autowired
	AgriculturalMapper agriculturalMapper;
	@Autowired
	ProductionMapper productionMapper;
	@Autowired
	CriculateMapper criculateMapper;
	@Autowired
	FoodMapper foodMapper;
	@Autowired
	IndustryMapper industryMapper;
	@Autowired
	HealthMapper healthMapper;
	@Autowired
	CosmeticMapper cosmeticMapper;
	@Autowired
	DrugMapper drugMapper;
	@Autowired
	WineMapper wineMapper;
	@Autowired
	MedicalMapper medicalMapper;
	@Autowired
	UsemedMapper usemedMapper;
	@Autowired
	SolveReportMapper solveReportMapper;
	@Autowired
	AppUserLocationMapper appUserLocationMapper;
	@Autowired
	EnterpriseUserMapper enterpriseUserMapper;
	@Autowired
	EnterpriseInfoMapper enterpriseInfoMapper;
	
	@Override
	public User userLogin(Map<String, Object> param) {
		String type = param.get("type").toString();
		if("0".equals(type)){
			User user = userMapper.userLogin(param);
			if(user!=null){
				return user;
			}
		}else if("1".equals(type)){
			EnterpriseUser enterpriseUser = enterpriseUserMapper.findEnterpriseUser(param);
			if(enterpriseUser!=null){
				User user = new User();
				user.setUsername(enterpriseUser.getUserName());
				user.setId(enterpriseUser.getId());
				return user;
			}
		}
		return null;
	}

	@Override
	public List<SupervisionAndCheck> getSupervisionAndCheck(Map<String, Object> param) {
		return supervisionAndCheckMapper.getSupervisionAndCheck(param);
	}

	@Override
	public SamplingInspection getSamplingInspection(Map<String, Object> param) {
		return samplingInspectionMapper.getSamplingInspection(param);
	}

	@Override
	public CaseInfo getCaseInfo(Map<String, Object> param) {
		return caseInfoMapperMapper.getCaseInfo(param);
	}

	@Override
	public Report getReport(Map<String, Object> param) {
		return reportMapper.getReport(param);
	}
	
	@Override
	public List<Report> getReportList(Map<String, Object> param) {
		return reportMapper.getReportList(param);
	}

	@Override
	public void insertSolveReport(SolveReport sr) {
		solveReportMapper.insertSelective(sr);
	}

	@Override
	public void insertAgricultural(Agricultural a) {
		agriculturalMapper.insertSelective(a);
	}

	@Override
	public void insertProduction(Production a) {
		productionMapper.insertSelective(a);
	}

	@Override
	public void insertCriculate(Criculate a) {
		criculateMapper.insertSelective(a);
		
	}

	@Override
	public void insertFood(Food a) {
		foodMapper.insertSelective(a);
		
	}

	@Override
	public void insertIndustry(Industry a) {
		industryMapper.insertSelective(a);
		
	}

	@Override
	public void insertHealth(Health a) {
		healthMapper.insertSelective(a);
		
	}

	@Override
	public void insertCosmetic(Cosmetic a) {
		cosmeticMapper.insertSelective(a);
		
	}

	@Override
	public void insertDrug(Drug a) {
		drugMapper.insertSelective(a);
		
	}

	@Override
	public void insertWine(Wine a) {
		wineMapper.insertSelective(a);
		
	}

	@Override
	public void insertMedical(Medical a) {
		medicalMapper.insertSelective(a);
		
	}

	@Override
	public void insertUsemed(Usemed a) {
		usemedMapper.insertSelective(a);
		
	}

	@Override
	public int insertAppUserLocation(AppUserLocation record) {
		return appUserLocationMapper.insert(record);
	}

	@Override
	public List<Map<String, Object>> selectEnterpriseInfoName(Map<String, Object> map) {
		return enterpriseInfoMapper.selectEnterpriseInfoName(map);
	}
}
