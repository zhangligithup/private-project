package com.foodregulation.service.exam;

import com.foodregulation.dao.entity.Exam;

import java.util.List;
import java.util.Map;

/**
 * @Description 试题库管理
 * @Author yangchao
 * @Date 2016/12/18.
 */
public interface ExamService {


    /**
     * 试题列表
     * @param map
     * @return
     */
    List<Exam> selectExam(Map<String,Object> map);

    /**
     * 试题总数
     * @return
     */
    long selectExamTotal(Map<String,Object> map);

    /**
     * 查找试题
     * @param id
     * @return
     */
    Exam findExam(Long id);


    /**
     * 新增试题
     * @return
     */
    public int addExam(Exam exam);


    /**
     * 修改试题
     * @param exam
     * @return
     */
    public int updateExam(Exam exam);


    /**
     * 删除试题
     * @param id
     * @return
     */
    public int delExam(Long id);

    /**
     * 随机抽取试题
     * @param map
     * @return
     */
    List<Long> selectExamRand(Map<String,Object> map);
}
