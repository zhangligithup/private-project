package com.foodregulation.service.administrative;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.PunishBasis;

public interface PunishBasisService {
	
	List<PunishBasis> selectPunishBasis(Map<String, Object> map);
	
    int deletePunishBasis(Integer punishBasisId);

    int insertPunishBasis(PunishBasis record);

    PunishBasis findPunishBasis(Integer punishBasisId);

    int updatePunishBasis(PunishBasis record);
    
    int selectPunishBasisTotal(Map<String, Object> params);

}
