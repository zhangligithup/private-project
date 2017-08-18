package com.foodregulation.serviceImpl.exam;

import com.foodregulation.dao.entity.Exam;
import com.foodregulation.dao.mapper.ExamMapper;
import com.foodregulation.service.exam.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Description 试题库管理
 * @Author yangchao
 * @Date 2016/12/18.
 */
@Service
public class ExamServiceImpl implements ExamService {
    @Autowired
    ExamMapper examMapper;

    /**
     * 试题列表
     *
     * @param map
     * @return
     */
    @Override
    public List<Exam> selectExam(Map<String, Object> map) {
        return examMapper.selectExam(map);
    }

    /**
     * 试题总数
     *
     * @return
     */
    @Override
    public long selectExamTotal(Map<String,Object> map) {
        return examMapper.selectExamTotal(map);
    }

    /**
     * 查找试题
     *
     * @param id
     * @return
     */
    @Override
    public Exam findExam(Long id) {
        return examMapper.selectByPrimaryKey(id);
    }

    /**
     * 新增试题
     *
     * @param exam
     * @return
     */
    @Override
    public int addExam(Exam exam) {
        return examMapper.insert(exam);
    }

    /**
     * 修改试题
     *
     * @param exam
     * @return
     */
    @Override
    public int updateExam(Exam exam) {
        return examMapper.updateByPrimaryKeySelective(exam);
    }

    /**
     * 删除试题
     *
     * @param id
     * @return
     */
    @Override
    public int delExam(Long id) {
        return examMapper.deleteByPrimaryKey(id);
    }

    /**
     * 随机抽取试题
     *
     * @param map
     * @return
     */
    @Override
    public List<Long> selectExamRand(Map<String, Object> map) {
        return examMapper.selectExamRand(map);
    }
}
