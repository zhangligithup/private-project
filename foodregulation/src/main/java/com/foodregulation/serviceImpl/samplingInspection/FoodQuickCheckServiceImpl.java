package com.foodregulation.serviceImpl.samplingInspection;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.FoodQuickCheck;
import com.foodregulation.dao.mapper.FoodQuickCheckMapper;
import com.foodregulation.service.samplingInspection.FoodQuickCheckService;

@Service
public class FoodQuickCheckServiceImpl implements FoodQuickCheckService {

	@Autowired
	FoodQuickCheckMapper foodQuickCheckMapper;
	@Override
	public List<FoodQuickCheck> findQuickCheckList(Map<String, Object> parma) {
		return foodQuickCheckMapper.selectQuickCheckList(parma);
	}

	@Override
	public int findQuickCheckListTotal(Map<String, Object> parma) {
		return foodQuickCheckMapper.selectQuickCheckListTotal(parma);
	}

	@Override
	public int batchInsert(List<FoodQuickCheck> dataList) {
		return foodQuickCheckMapper.batchInsert(dataList);
	}

	@Override
	public int removeFoodQuickCheck(Integer id) {
		return foodQuickCheckMapper.deleteByPrimaryKey(id);
	}

	@Override
	public FoodQuickCheck queryFoodQuickCheck(Integer id) {
		return foodQuickCheckMapper.selectByPrimaryKey(id);
	}

	@Override
	public int saveModifyFoodQuickCheck(FoodQuickCheck foodQuickCheck) {
		return foodQuickCheckMapper.updateByPrimaryKeySelective(foodQuickCheck);
	}

}
