package com.foodregulation.serviceImpl.administrative;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.PunishBasis;
import com.foodregulation.dao.mapper.PunishBasisMapper;
import com.foodregulation.service.administrative.PunishBasisService;

@Service
public class PunishBasisServiceImpl implements PunishBasisService{
	
	@Autowired
	PunishBasisMapper punishBasisMapper;

	@Override
	public List<PunishBasis> selectPunishBasis(Map<String, Object> map) {
		return punishBasisMapper.selectPunishBasis(map);
	}

	@Override
	public int deletePunishBasis(Integer punishBasisId) {
		return punishBasisMapper.deletePunishBasis(punishBasisId);
	}

	@Override
	public int insertPunishBasis(PunishBasis record) {
		return punishBasisMapper.insertPunishBasis(record);
	}

	@Override
	public PunishBasis findPunishBasis(Integer punishBasisId) {
		return punishBasisMapper.findPunishBasis(punishBasisId);
	}

	@Override
	public int updatePunishBasis(PunishBasis record) {
		return punishBasisMapper.updatePunishBasis(record);
	}

	@Override
	public int selectPunishBasisTotal(Map<String, Object> params) {
		return punishBasisMapper.selectPunishBasisTotal(params);
	}

	
}
