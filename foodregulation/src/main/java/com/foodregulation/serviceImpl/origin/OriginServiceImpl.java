package com.foodregulation.serviceImpl.origin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.AdditiveFiling;
import com.foodregulation.dao.entity.KeepRecord;
import com.foodregulation.dao.entity.PurchaseLedger;
import com.foodregulation.dao.mapper.AdditiveFilingMapper;
import com.foodregulation.dao.mapper.KeepRecordMapper;
import com.foodregulation.dao.mapper.PurchaseLedgerMapper;
import com.foodregulation.service.origin.OriginService;

@Service
public class OriginServiceImpl implements OriginService{
	
	@Autowired
	PurchaseLedgerMapper purchaseLedgerMapper;
	
	@Autowired
	AdditiveFilingMapper additiveFilingMapper;
	
	@Autowired
	KeepRecordMapper keepRecordMapper;

	@Override
	public List<PurchaseLedger> selectPurchaseLedger(Map<String, Object> map) {
		return purchaseLedgerMapper.selectPurchaseLedger(map);
	}

	@Override
	public int selectPurchaseLedgerTotal(Map<String, Object> map) {
		return purchaseLedgerMapper.selectPurchaseLedgerTotal(map);
	}
	@Override
	public List<PurchaseLedger> selectPurchaseLedgerApp(Map<String, Object> map) {
		return purchaseLedgerMapper.selectPurchaseLedgerApp(map);
	}
	
	@Override
	public int selectPurchaseLedgerTotalApp(Map<String, Object> map) {
		return purchaseLedgerMapper.selectPurchaseLedgerTotalApp(map);
	}

	@Override
	public int deletePurchaseLedger(Integer id) {
		return purchaseLedgerMapper.deletePurchaseLedger(id);
	}

	@Override
	public int insertPurchaseLedger(PurchaseLedger record) {
		return purchaseLedgerMapper.insertPurchaseLedger(record);
	}

	@Override
	public PurchaseLedger findPurchaseLedger(Integer id) {
		return purchaseLedgerMapper.findPurchaseLedger(id);
	}

	@Override
	public int updatePurchaseLedger(PurchaseLedger record) {
		return purchaseLedgerMapper.updatePurchaseLedger(record);
	}

	@Override
	public List<AdditiveFiling> selectAdditiveFiling(Map<String, Object> map) {
		return additiveFilingMapper.selectAdditiveFiling(map);
	}

	@Override
	public int selectAdditiveFilingTotal(Map<String, Object> map) {
		return additiveFilingMapper.selectAdditiveFilingTotal(map);
	}

	@Override
	public int deleteAdditiveFiling(Integer id) {
		return additiveFilingMapper.deleteAdditiveFiling(id);
	}

	@Override
	public int insertAdditiveFiling(AdditiveFiling record) {
		return additiveFilingMapper.insertAdditiveFiling(record);
	}

	@Override
	public AdditiveFiling findAdditiveFiling(Integer id) {
		return additiveFilingMapper.findAdditiveFiling(id);
	}

	@Override
	public int updateAdditiveFiling(AdditiveFiling record) {
		return additiveFilingMapper.updateAdditiveFiling(record);
	}

	@Override
	public List<KeepRecord> selectKeepRecord(Map<String, Object> map) {
		return keepRecordMapper.selectKeepRecord(map);
	}

	@Override
	public int deleteKeepRecord(Integer id) {
		return keepRecordMapper.deleteKeepRecord(id);
	}

	@Override
	public int insertKeepRecord(KeepRecord record) {
		return keepRecordMapper.insertKeepRecord(record);
	}

	@Override
	public KeepRecord findKeepRecord(Integer id) {
		return keepRecordMapper.findKeepRecord(id);
	}

	@Override
	public int updateKeepRecord(KeepRecord record) {
		return keepRecordMapper.updateKeepRecord(record);
	}

	@Override
	public int selectKeepRecordTotal(Map<String, Object> map) {
		return keepRecordMapper.selectKeepRecordTotal(map);
	}
	
	
	

}
