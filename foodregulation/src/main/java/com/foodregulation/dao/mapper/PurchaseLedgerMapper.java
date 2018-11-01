package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.PurchaseLedger;

public interface PurchaseLedgerMapper {
	
	List<PurchaseLedger> selectPurchaseLedger(Map<String, Object> map);
	
	int selectPurchaseLedgerTotal(Map<String, Object> map);
	
	List<PurchaseLedger> selectPurchaseLedgerApp(Map<String, Object> map);
	
	int selectPurchaseLedgerTotalApp(Map<String, Object> map);
	
    int deletePurchaseLedger(Integer id);

    int insertPurchaseLedger(PurchaseLedger record);

    PurchaseLedger findPurchaseLedger(Integer id);

    int updatePurchaseLedger(PurchaseLedger record);
    
}