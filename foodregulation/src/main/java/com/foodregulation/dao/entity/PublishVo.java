package com.foodregulation.dao.entity;

import java.io.Serializable;
import java.util.List;

/**
 * Created by JamesBond on 2016/12/25.
 */
public class PublishVo implements Serializable {
    private List<ExamPublish> list;

    public List<ExamPublish> getList() {
        return list;
    }

    public void setList(List<ExamPublish> list) {
        this.list = list;
    }
}
