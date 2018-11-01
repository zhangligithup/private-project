package com.foodregulation.serviceImpl.administrative;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.CaseFrom;
import com.foodregulation.dao.mapper.CaseFromMapper;
import com.foodregulation.service.administrative.CasefromService;

@Service
public class CasefromServiceImpl implements CasefromService{
	
	@Autowired
	CaseFromMapper caseFromMapper;

	@Override
	public List<CaseFrom> selectCaseFrom(Map<String, Object> map) {
		return caseFromMapper.selectCaseFrom(map);
	}

	@Override
	public int deleteCaseFrom(Integer caseFromId) {
		return caseFromMapper.deleteCaseFrom(caseFromId);
	}

	@Override
	public int insertCaseFrom(CaseFrom record) {
		return caseFromMapper.insertCaseFrom(record);
	}

	@Override
	public CaseFrom findCaseFrom(Integer caseFromId) {
		return caseFromMapper.findCaseFrom(caseFromId);
	}

	@Override
	public int updateCaseFrom(CaseFrom record) {
		return caseFromMapper.updateCaseFrom(record);
	}

	@Override
	public int selectCaseFromTotal() {
		return caseFromMapper.selectCaseFromTotal();
	}

}
