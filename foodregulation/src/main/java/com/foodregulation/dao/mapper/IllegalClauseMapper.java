package com.foodregulation.dao.mapper;

import java.util.List;
import java.util.Map;

import com.foodregulation.dao.entity.IllegalClause;

public interface IllegalClauseMapper {
	List<IllegalClause> selectIllegalClause(Map<String, Object> map);
	
    int deleteIllegalClause(Integer illegalClauseId);

    int insertIllegalClause(IllegalClause record);

    IllegalClause findIllegalClause(Integer illegalClauseId);

    int updateIllegalClause(IllegalClause record);
    
    int selectIllegalClauseTotal(Map<String, Object> map);
}