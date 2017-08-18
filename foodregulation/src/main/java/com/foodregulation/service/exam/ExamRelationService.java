package com.foodregulation.service.exam;

import com.foodregulation.dao.entity.ExamRelation;

import java.util.List;

/** 试题试卷关系
 * Created by JamesBond on 2016/12/24.
 */
public interface ExamRelationService {

    /**
     * 试题试卷关联
     * @param examRelations
     * @return
     */
    int insertList(List<ExamRelation> examRelations);

    int findTotalExam(long id);
}
