package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.SupervisionAndCheckTask;

public interface SupervisionAndCheckTaskMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SupervisionAndCheckTask record);

    int insertSelective(SupervisionAndCheckTask record);

    SupervisionAndCheckTask selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SupervisionAndCheckTask record);

    int updateByPrimaryKeyWithBLOBs(SupervisionAndCheckTask record);

    int updateByPrimaryKey(SupervisionAndCheckTask record);
    
    /**
     * 查询监督检查任务列表
     * @param param
     * @return
     */
    List<SupervisionAndCheckTask> selectSupervisionCheckTask(Map<String,Object> param);
	
    /**
     * 查询监督检查任务总数
     * @param param
     * @return
     */
	int selectSupervisionCheckTaskTotal(Map<String,Object> param);
}