package com.foodregulation.dao.entity;

import java.io.Serializable;

public class ExamRelation implements Serializable {
    private Long id;

    private Long examinationid;

    private Long examid;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getExaminationid() {
        return examinationid;
    }

    public void setExaminationid(Long examinationid) {
        this.examinationid = examinationid;
    }

    public Long getExamid() {
        return examid;
    }

    public void setExamid(Long examid) {
        this.examid = examid;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        ExamRelation other = (ExamRelation) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getExaminationid() == null ? other.getExaminationid() == null : this.getExaminationid().equals(other.getExaminationid()))
            && (this.getExamid() == null ? other.getExamid() == null : this.getExamid().equals(other.getExamid()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getExaminationid() == null) ? 0 : getExaminationid().hashCode());
        result = prime * result + ((getExamid() == null) ? 0 : getExamid().hashCode());
        return result;
    }
}