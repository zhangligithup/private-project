package com.foodregulation.serviceImpl.administrative;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.CaseInfo;
import com.foodregulation.dao.mapper.CaseInfoMapper;
import com.foodregulation.service.administrative.CaseInfoService;

@Service
public class CaseInfoServiceImpl implements CaseInfoService{
	
	@Autowired
	CaseInfoMapper caseInfoMapper;

	@Override
	public List<CaseInfo> selectCaseInfo(Map<String, Object> map) {
		List<CaseInfo> list = caseInfoMapper.selectCaseInfo(map);
		//查询违法条款 和 处罚依据
		for(int i=0;i<list.size();i++){
			//处罚依据
			List<CaseInfo> punishBasisContentsList = caseInfoMapper.findPunishBasisContents(list.get(i).getCaseInfoId());
			String punishBasisContents = "";
			if(punishBasisContentsList!=null&&punishBasisContentsList.size()!=0){
				CaseInfo caseInfo = punishBasisContentsList.get(0);
				if(caseInfo!=null){
					punishBasisContents = caseInfo.getPunishBasisContents()==null?"":caseInfo.getPunishBasisContents();
				}
			}
			list.get(i).setPunishBasisContents(punishBasisContents);
			//违法条款
			List<CaseInfo> illegalClauseContentsList = caseInfoMapper.findIllegalClauseContents(list.get(i).getCaseInfoId());
			String illegalClauseContents = "";
			if(illegalClauseContentsList!=null&&illegalClauseContentsList.size()!=0){
				CaseInfo caseInfo = illegalClauseContentsList.get(0);
				if(caseInfo!=null){
					illegalClauseContents = caseInfo.getIllegalClauseContents()==null?"":caseInfo.getIllegalClauseContents();
				}
			}
			list.get(i).setIllegalClauseContents(illegalClauseContents);
		}
		return list;
	}

	@Override
	public int deleteCaseInfo(Integer caseInfoId) {
		return caseInfoMapper.deleteCaseInfo(caseInfoId);
	}

	@Override
	public int insertCaseInfo(CaseInfo record) {
		return caseInfoMapper.insertCaseInfo(record);
	}

	@Override
	public CaseInfo findCaseInfo(Integer caseInfoId) {
		CaseInfo caseInfo = caseInfoMapper.findCaseInfo(caseInfoId);
		//查询违法条款 和 处罚依据
		
		//处罚依据
		List<CaseInfo> punishBasisContentsList = caseInfoMapper.findPunishBasisContents(caseInfo.getCaseInfoId());
		String punishBasisContents = "";
		if(punishBasisContentsList!=null&&punishBasisContentsList.size()!=0){
			CaseInfo caseInfo1 = punishBasisContentsList.get(0);
			if(caseInfo!=null&&caseInfo1!=null){
				punishBasisContents = caseInfo1.getPunishBasisContents()==null?"":caseInfo1.getPunishBasisContents();
			}
		}
		caseInfo.setPunishBasisContents(punishBasisContents);
		//违法条款
		List<CaseInfo> illegalClauseContentsList = caseInfoMapper.findIllegalClauseContents(caseInfo.getCaseInfoId());
		String illegalClauseContents = "";
		if(illegalClauseContentsList!=null&&illegalClauseContentsList.size()!=0){
			CaseInfo caseInfo2 = illegalClauseContentsList.get(0);
			if(caseInfo!=null&&caseInfo2!=null){
				illegalClauseContents = caseInfo2.getIllegalClauseContents()==null?"":caseInfo2.getIllegalClauseContents();
			}
		}
		caseInfo.setIllegalClauseContents(illegalClauseContents);
		
		return caseInfo;
	}

	@Override
	public int updateCaseInfo(CaseInfo record) {
		return caseInfoMapper.updateCaseInfo(record);
	}

	@Override
	public int selectCaseInfoTotal(Map<String, Object> params) {
		return caseInfoMapper.selectCaseInfoTotal(params);
	}

	

}
