package com.foodregulation.serviceImpl.exam;

import com.foodregulation.dao.entity.ExamRelation;
import com.foodregulation.dao.mapper.ExamRelationMapper;
import com.foodregulation.service.exam.ExamRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by JamesBond on 2016/12/24.
 */
@Service
public class ExamRelationServiceImpl implements ExamRelationService {
    @Autowired
    ExamRelationMapper examRelationMapper;

    /**
     * 试题试卷关联
     *
     * @param examRelations
     * @return
     */
    @Override
    public int insertList(List<ExamRelation> examRelations) {
        return examRelationMapper.insertList(examRelations);
    }

    @Override
    public int findTotalExam(long id) {
        return examRelationMapper.findTotalExam(id);
    }
}
