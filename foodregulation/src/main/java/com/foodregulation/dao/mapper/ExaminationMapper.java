package com.foodregulation.dao.mapper;

import com.foodregulation.dao.entity.Examination;

import java.util.List;
import java.util.Map;

public interface ExaminationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Examination record);

    int insertSelective(Examination record);

    Examination selectByPrimaryKey(Long id);

    List<Examination> findExaminationList(Map<String,Object> map);

    long selectExaminationTotal();

    List<Examination> selectExamination(Map<String,Object> map);

    int updateByPrimaryKeySelective(Examination record);

    int updateByPrimaryKey(Examination record);

    String findAccountType(int id);

    List<Map<String,Object>> findCongYeScore(Map<String,Object> map);

    Long findCongYeScoreTotal(Map<String,Object> map);

    List<Map<String,Object>> findJianGuanScore(Map<String,Object> map);

    Long findJianGuanScoreTotal(Map<String,Object> map);

    List<Map<String,Object>> findMyExamination(Map<String,Object> map);

    List<Map<String,Object>> findExamAndMyAnswer(Map<String,Object> map);
    List<Map<String,Object>> findComExamAndMyAnswer(Map<String,Object> map);
    Map<String,Object> findPersonExamScire(Map<String,Object> map);

    List<Map<String,Object>> findCongyeExamList(Map<String,Object> map);

    long findCongyeExamListTotal(Map<String,Object> map);
}