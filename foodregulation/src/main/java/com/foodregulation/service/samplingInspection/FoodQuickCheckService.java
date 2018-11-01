package com.foodregulation.service.samplingInspection;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.FoodQuickCheck;

public interface FoodQuickCheckService {
	
    List<FoodQuickCheck> findQuickCheckList(Map<String,Object> parma);
    
    int findQuickCheckListTotal(Map<String,Object> parma);
    
    int batchInsert(List<FoodQuickCheck> dataList);
    
    int removeFoodQuickCheck(Integer id);
    
    public FoodQuickCheck queryFoodQuickCheck(Integer id);
    
    public int saveModifyFoodQuickCheck(FoodQuickCheck foodQuickCheck);
}
