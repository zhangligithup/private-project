package com.foodregulation.dao.entity;

import java.io.Serializable;

public class Exam implements Serializable {
    private Long id;

    private String exType;

    private String answer;

    private Long examinationId;

    private String content="";
    
    private String title;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getExType() {
        return exType;
    }

    public void setExType(String exType) {
        this.exType = exType == null ? null : exType.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public Long getExaminationId() {
        return examinationId;
    }

    public void setExaminationId(Long examinationId) {
        this.examinationId = examinationId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? "" : content.trim();
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
        Exam other = (Exam) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getExType() == null ? other.getExType() == null : this.getExType().equals(other.getExType()))
            && (this.getAnswer() == null ? other.getAnswer() == null : this.getAnswer().equals(other.getAnswer()))
            && (this.getExaminationId() == null ? other.getExaminationId() == null : this.getExaminationId().equals(other.getExaminationId()))
            && (this.getContent() == null ? other.getContent() == null : this.getContent().equals(other.getContent()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getExType() == null) ? 0 : getExType().hashCode());
        result = prime * result + ((getAnswer() == null) ? 0 : getAnswer().hashCode());
        result = prime * result + ((getExaminationId() == null) ? 0 : getExaminationId().hashCode());
        result = prime * result + ((getContent() == null) ? 0 : getContent().hashCode());
        return result;
    }

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}