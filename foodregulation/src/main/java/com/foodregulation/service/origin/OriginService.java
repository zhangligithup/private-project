package com.foodregulation.service.origin;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.AdditiveFiling;
import com.foodregulation.dao.entity.KeepRecord;
import com.foodregulation.dao.entity.PurchaseLedger;

public interface OriginService {
	
	/**
	 *  产品进货台账
	 * @Description: TODO
	 * @author: kongjiang
	 * @param map
	 * @return
	 */
	List<PurchaseLedger> selectPurchaseLedger(Map<String, Object> map);
	
	int selectPurchaseLedgerTotal(Map<String, Object> map);
	
	List<PurchaseLedger> selectPurchaseLedgerApp(Map<String, Object> map);
	
	int selectPurchaseLedgerTotalApp(Map<String, Object> map);

    int deletePurchaseLedger(Integer id);

    int insertPurchaseLedger(PurchaseLedger record);

    PurchaseLedger findPurchaseLedger(Integer id);

    int updatePurchaseLedger(PurchaseLedger record);
    
    /**
     * 食品添加剂备案
     * @Description: TODO
     * @author: kongjiang
     * @param map
     * @return
     */
    
    List<AdditiveFiling> selectAdditiveFiling(Map<String, Object> map);
	
	int selectAdditiveFilingTotal(Map<String, Object> map);
	
    int deleteAdditiveFiling(Integer id);

    int insertAdditiveFiling(AdditiveFiling record);

    AdditiveFiling findAdditiveFiling(Integer id);

    int updateAdditiveFiling(AdditiveFiling record);
    
    
    /**
     * 备案登记表
     * @Description: TODO
     * @author: kongjiang
     * @param map
     * @return
     */
    
    List<KeepRecord> selectKeepRecord(Map<String, Object> map);
    
    int selectKeepRecordTotal(Map<String, Object> map);
	
    int deleteKeepRecord(Integer id);

    int insertKeepRecord(KeepRecord record);

    KeepRecord findKeepRecord(Integer id);

    int updateKeepRecord(KeepRecord record);
    
}
