package com.foodregulation.serviceImpl.administrative;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.IllegalClause;
import com.foodregulation.dao.mapper.IllegalClauseMapper;
import com.foodregulation.service.administrative.IllegalClauseService;

@Service
public class IllegalClauseServiceImpl implements IllegalClauseService{
	
	@Autowired
	IllegalClauseMapper illegalClauseMapper;

	@Override
	public List<IllegalClause> selectIllegalClause(Map<String, Object> map) {
		return illegalClauseMapper.selectIllegalClause(map);
	}

	@Override
	public int deleteIllegalClause(Integer illegalClauseId) {
		return illegalClauseMapper.deleteIllegalClause(illegalClauseId);
	}

	@Override
	public int insertIllegalClause(IllegalClause record) {
		return illegalClauseMapper.insertIllegalClause(record);
	}

	@Override
	public IllegalClause findIllegalClause(Integer illegalClauseId) {
		return illegalClauseMapper.findIllegalClause(illegalClauseId);
	}

	@Override
	public int updateIllegalClause(IllegalClause record) {
		return illegalClauseMapper.updateIllegalClause(record);
	}

	@Override
	public int selectIllegalClauseTotal(Map<String,Object> map) {
		return illegalClauseMapper.selectIllegalClauseTotal(map);
	}

	

}
