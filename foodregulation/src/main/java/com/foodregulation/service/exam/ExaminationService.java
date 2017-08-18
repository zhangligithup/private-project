package com.foodregulation.service.exam;

import com.foodregulation.dao.entity.ExamPublish;
import com.foodregulation.dao.entity.ExamRecord;
import com.foodregulation.dao.entity.Examination;

import java.util.List;
import java.util.Map;

/**
 * @Description 试卷管理
 * @Author yangchao
 * @Date 2016/12/18.
 */
public interface ExaminationService {


    /**
     * 试卷列表
     * @param map
     * @return
     */
    List<Examination> selectExamination(Map<String,Object> map);

    /**
     * 试卷总数
     * @return
     */
    long selectExaminationTotal();

    /**
     * 查找试卷
     * @param id
     * @return
     */
    Examination findExamination(Long id);

    /**
     * 新增试卷
     * @return
     */
    public int addExamination(Examination examination);


    /**
     * 修改试卷
     * @param examination
     * @return
     */
    public int updateExamination(Examination examination);


    /**
     * 删除试卷
     * @param id
     * @return
     */
    public int delExamination(Long id);

    /**
     * 试卷列表
     * @param map
     * @return
     */
    List<Examination> findExaminationList(Map<String,Object> map);

    /**
     * 发布试卷
     *
     * @param examPublish
     * @return
     */
    public int insertPublish(ExamPublish examPublish);

    /**
     * 查找是否发布过试卷
     * @param examPublish
     * @return
     */
    public int existPublish(ExamPublish examPublish);

    /**
     * 答题
     * @param records
     * @return
     */
    int insertListRecord(List<ExamRecord> records);

    /**
     * 从业人员查看结果
     * @param map
     * @return
     */
    List<Map<String,Object>> findCongYeScore(Map<String,Object> map);

    /**
     * 从业人员查看结果总数
     * @param map
     * @return
     */
    Long findCongYeScoreTotal(Map<String,Object> map);

    /**
     * 执法人员查看结果
     * @param map
     * @return
     */
    List<Map<String,Object>> findJianGuanScore(Map<String,Object> map);

    /**
     * 执法人员查看结果总数
     * @param map
     * @return
     */
    Long findJianGuanScoreTotal(Map<String,Object> map);


    /**
     * 我的试卷
     * @param map
     * @return
     */
    List<Map<String,Object>> findMyExamination(Map<String,Object> map);


    /**
     * 查找试卷以及试卷答题情况(执法人员)
     * @param map
     * @return
     */
    List<Map<String,Object>> findExamAndMyAnswer(Map<String,Object> map);

    /**
     * 查找试卷以及试卷答题情况(企业人员)
     * @param map
     * @return
     */
    List<Map<String,Object>> findComExamAndMyAnswer(Map<String,Object> map);


    /**
     * 查找某人某试卷分数
     * @param map
     * @return
     */
    Map<String,Object> findPersonExamScire(Map<String,Object> map);


    /**
     * 查找从业人员试卷列表
     * @param map
     * @return
     */
    List<Map<String,Object>> findCongyeExamList(Map<String,Object> map);

    /**
     * 查找从业人员试卷列表总数
     * @param map
     * @return
     */
    long findCongyeExamListTotal(Map<String,Object> map);
}
