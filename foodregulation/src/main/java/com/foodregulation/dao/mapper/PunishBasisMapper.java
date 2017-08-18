package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.PunishBasis;

public interface PunishBasisMapper {
	
	List<PunishBasis> selectPunishBasis(Map<String, Object> map);
	
    int deletePunishBasis(Integer punishBasisId);

    int insertPunishBasis(PunishBasis record);

    PunishBasis findPunishBasis(Integer punishBasisId);

    int updatePunishBasis(PunishBasis record);
    
    int selectPunishBasisTotal(Map<String, Object> params);
}