package com.foodregulation.serviceImpl.exam;

import com.foodregulation.dao.entity.ExamPublish;
import com.foodregulation.dao.entity.ExamRecord;
import com.foodregulation.dao.entity.Examination;
import com.foodregulation.dao.mapper.ExamPublishMapper;
import com.foodregulation.dao.mapper.ExamRecordMapper;
import com.foodregulation.dao.mapper.ExaminationMapper;
import com.foodregulation.service.exam.ExaminationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Description 试卷管理
 * @Author yangchao
 * @Date 2016/12/18.
 */
@Service
public class ExaminationServiceImpl implements ExaminationService {
	@Autowired
	ExaminationMapper examinationMapper;
	@Autowired
	ExamPublishMapper examPublishMapper;
	@Autowired
	ExamRecordMapper examRecordMapper;

	/**
	 * 试卷列表
	 *
	 * @param map
	 * @return
	 */
	@Override
	public List<Examination> selectExamination(Map<String, Object> map) {
		List<Examination> list = examinationMapper.selectExamination(map);
		return list;
	}

	/**
	 * 试卷总数
	 *
	 * @return
	 */
	@Override
	public long selectExaminationTotal() {
		return examinationMapper.selectExaminationTotal();
	}

	/**
	 * 查找试卷
	 *
	 * @param id
	 * @return
	 */
	@Override
	public Examination findExamination(Long id) {
		return examinationMapper.selectByPrimaryKey(id);
	}

	/**
	 * 新增试卷
	 *
	 * @param examination
	 * @return
	 */
	@Override
	public int addExamination(Examination examination) {
		return examinationMapper.insert(examination);
	}

	/**
	 * 修改试卷
	 *
	 * @param examination
	 * @return
	 */
	@Override
	public int updateExamination(Examination examination) {
		return examinationMapper.updateByPrimaryKeySelective(examination);
	}

	/**
	 * 删除试卷
	 *
	 * @param id
	 * @return
	 */
	@Override
	public int delExamination(Long id) {
		return examinationMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 试卷列表
	 *
	 * @param map
	 * @return
	 */
	@Override
	public List<Examination> findExaminationList(Map<String, Object> map) {
		return examinationMapper.findExaminationList(map);
	}

	/**
	 * 发布试卷
	 *
	 * @param examPublish
	 * @return
	 */
	@Override
	public int insertPublish(ExamPublish examPublish) {
		return examPublishMapper.insert(examPublish);
	}

	/**
	 * 查找是否发布过试卷
	 *
	 * @param examPublish
	 * @return
	 */
	@Override
	public int existPublish(ExamPublish examPublish) {
		return examPublishMapper.existPublish(examPublish);
	}

	/**
	 * 答题
	 *
	 * @param records
	 * @return
	 */
	@Override
	public int insertListRecord(List<ExamRecord> records) {
		return examRecordMapper.insertList(records);
	}

	/**
	 * 查看从业人员结果
	 *
	 * @param map
	 * @return
	 */
	@Override
	public List<Map<String, Object>> findCongYeScore(Map<String, Object> map) {
		return examinationMapper.findCongYeScore(map);
	}

	/**
	 * 查看从业人员结果总数
	 * 
	 * @param map
	 * @return
	 */
	@Override
	public Long findCongYeScoreTotal(Map<String, Object> map) {
		return examinationMapper.findCongYeScoreTotal(map);
	}

	/**
	 * 执法人员查看结果
	 *
	 * @param map
	 * @return
	 */
	@Override
	public List<Map<String, Object>> findJianGuanScore(Map<String, Object> map) {
		return examinationMapper.findJianGuanScore(map);
	}

	/**
	 * 执法人员查看结果总数
	 *
	 * @param map
	 * @return
	 */
	@Override
	public Long findJianGuanScoreTotal(Map<String, Object> map) {
		return examinationMapper.findJianGuanScoreTotal(map);
	}

	/**
	 * 我的试卷列表
	 *
	 * @param map
	 * @return
	 */
	@Override
	public List<Map<String, Object>> findMyExamination(Map<String, Object> map) {
		return examinationMapper.findMyExamination(map);
	}

	/**
	 * 查找试卷以及试卷答题情况
	 *
	 * @param map
	 * @return
	 */
	@Override
	public List<Map<String, Object>> findExamAndMyAnswer(Map<String, Object> map) {
		return examinationMapper.findExamAndMyAnswer(map);
	}

	/**
	 * 查找试卷以及试卷答题情况(企业人员)
	 *
	 * @param map
	 * @return
	 */
	@Override
	public List<Map<String, Object>> findComExamAndMyAnswer(Map<String, Object> map) {
		return examinationMapper.findComExamAndMyAnswer(map);
	}

	/**
	 * 查找某人某试卷分数
	 *
	 * @param map
	 * @return
	 */
	@Override
	public Map<String, Object> findPersonExamScire(Map<String, Object> map) {
		return examinationMapper.findPersonExamScire(map);
	}

	/**
	 * 查找从业人员试卷列表
	 *
	 * @param map
	 * @return
	 */
	@Override
	public List<Map<String, Object>> findCongyeExamList(Map<String, Object> map) {
		return examinationMapper.findCongyeExamList(map);
	}

	/**
	 * 查找从业人员试卷列表总数
	 *
	 * @param map
	 * @return
	 */
	@Override
	public long findCongyeExamListTotal(Map<String, Object> map) {
		return examinationMapper.findCongyeExamListTotal(map);
	}

	@Override
	public int deleteRecord(String examinationId, String personId, String type) {
		return this.examRecordMapper.deleteRecord(examinationId, personId, type);
	}

	@Override
	public int isAnswerExam(String examinationId, String personId, String type) {
		return this.examRecordMapper.isAnswerExam(examinationId, personId, type);
	}
}
